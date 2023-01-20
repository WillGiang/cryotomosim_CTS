function [cts] = cts_model(vol,param,opt)
%[cts] = cts_model(vol,pix,param,opt)
%generates model information for a single tomographic acquisition, stored in output struct cts
%works by iteratively placing input particles at random orientations in random locations without overlap
%
%Inputs
%
%vol            required, preferred input = zeros(x,y,z)
%3d array to fill with the model. standard is empty but accepts non-empty arrays (needs voids to work though)
%
%param    struct generated by param_model function, optional. a cell array of arguments will parse through
%
%opt - name-val pairs that control some outputs
%suffix - adds a suffix to the output file for further identification
%graph - outputs a continuous graph of particle placements during model generation (slow, not really useful)
%
%Output
%a folder will be generated with a name of the input particles, with a .mrc of vol and a .mat of ts
%ts is a multilayer struct organizing several inputs, outputs, and intermediates
%vol has the final output model, containing all objects 
%pix retains the input pixel size
%model retains the separate classes of components - the isolated grid, the constraint borders, targets, or
%distractors
%targets is a struct array of each input particle grouping, including filename, id, volume, and type
%splitmodel has fields of each target id, containing a volume of only those particles from the model

arguments
    vol (:,:,:) double
    param = param_model
    
    opt.suffix = ''
    opt.graph = 0
    
    %opt to save incremental models for each layer and component of model building?
    %save the splitmodels in another file to reduce bloat in cts?
end
if iscell(param), param = param_model(param{:}); end
pix = param.pix;
%{
runtime = numel(vol)/60*1.2e-5; %for my laptop, doesn't really apply to anything else
%need to compute by iterations too, vol alone not that relevant
fprintf('Estimated model generation time with hamster laptop: %g minutes\n',runtime)
if runtime>30 %if >30 mins force manual input start
    txt = input('Runtime is long, verify inputs. ctlr+C to end, or enter "proceed" to run anyway: ','s');
    if ~strcmp(txt,'proceed')
        cts = NaN; fprintf('Model generation declined, process aborted.\n')
        return
    end
end
%}

%initialize the struct so the order is invariant and fill with input information
cts = struct('vol',vol,'model',[],'splitmodel',[]);%,'particles',[]);%,'inputs',[]);
cts.param = param; %store parameters in the struct
%need a better storage organization

if param.grid(1)~=0 % new carbon grid and hole generator
    fprintf('Generating carbon film ')
    [cts.model.grid] = gen_carbongrid(vol,pix,param.grid);
    cts.vol = cts.model.grid+cts.vol; fprintf('   complete \n')
end
if param.mem~=0 %new membrane gen, makes spherical vesicles and places randomly
    fprintf('Generating vesicular membranes ')
    [cts.model.mem,count,~,vescen,vesvol] = gen_vesicle(cts.vol,round(param.mem),pix);
    cts.vol = cts.model.mem+cts.vol;
    fprintf('   complete,  %i placed, %i failed \n',count.s,count.f)
else
    vescen = 0; vesvol = 0;
end

%apply constraints to indicated borders with helper function, scale by pixel size to prevent overlapping
constraint = helper_constraints(zeros(size(cts.vol)),param.constraint)*pix^2.5;
%{
constraint = zeros(size(cts.vol)); %constraints are a big ugly mess right now
switch param.constraint %write constraints to initial starting volume
    case 'none'
    case 'box' %intensity is ^2.3 to better match protein and prevent bad binarizations/overlap
        constraint(1:end,1:end,[1 end]) = pix^2.5; %constraint(1:end,1:end,end) = 1; %z end panes
        constraint(1:end,[1 end],1:end) = pix^2.5; %constraint(1:end,end,1:end) = 1; %y end panes
        constraint([1 end],1:end,1:end) = pix^2.5; %constraint(end,1:end,1:end) = 1; %x end panes
        disp('Warning: with a complete box, some particles may be impossible to place')
    case 'tube'
        constraint(1:end,1:end,[1 end]) = pix^2.5; %constraint(1:end,1:end,end) = 1; %z end panes
        constraint(1:end,[1 end],1:end) = pix^2.5; %constraint(1:end,end,1:end) = 1; %y end panes
    case 'sides'
        constraint(1:end,1:end,[1 end]) = pix^2.5; %constraint(1:end,1:end,end) = 1; %z end panes
end
%}

%generate model and add (in case input vol had stuff in it)
[cts.model.targets, cts.splitmodel] = helper_randomfill(cts.vol+constraint,param.layers,param.iters,...
    vescen,vesvol,param.density,'type','target','graph',opt.graph); 
cts.vol = max(cts.vol,cts.model.targets); %to avoid overlap intensity between transmem and vesicle
cts.model.particles = cts.vol;

if param.beads~=0 %bead generation and placement block
    beadstrc = gen_beads(pix,param.beads(2:end)); %external generation of varied beads
    cts.particles.beads = beadstrc;
    [cts.model.beads] = helper_randomfill(cts.vol+constraint,beadstrc,param.beads(1),param.density,...
        'type','bead');
    cts.vol = cts.vol + cts.model.beads; 
    cts.model.particles = cts.vol;
end

if ~param.ice==0 % vitreous ice generator, randomized molecular h2o throughout the volume
    fprintf('Generating vitreous ice')
    [iced, ice] = gen_ice(cts.vol,pix);
    cts.model.ice = ice; cts.vol = iced; fprintf('   done \n')
end

%folder and file generation stuff
time = string(datetime('now','Format','yyyy-MM-dd''t''HH.mm')); %timestamp
ident = char(strjoin(fieldnames(cts.splitmodel),'_')); %combine target names to one string
if length(ident)>60, ident=ident(1:60); end %truncation check to prevent invalidly long filenames
foldername = append('model_',time,'_',ident,'_pixelsize_',string(pix)); %combine info for folder name

%move to output directory in user/tomosim
cd(getenv('HOME')); if ~isfolder('tomosim'), mkdir tomosim; end, cd tomosim
mkdir(foldername); cd(foldername);
WriteMRC(cts.vol,pix,append(ident,opt.suffix,'.mrc'))
save(append(ident,opt.suffix,'.mat'),'cts','-v7.3')

%output text file of input informations?
cd(userpath)
end