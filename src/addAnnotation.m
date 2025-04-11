function addAnnotation(I,F,B,srcPath,projectPath,fname)
% addAnnotation Add an training-annotation pair to an existing root painter file structure
%
% Syntax
%   addAnnotation(I,J,projectPath)
%
% Arguments
%   I - the training image
%   F - the boolean annotation foreground image 
%   B - the boolean annotation background image 
%   srcPath - path to the image data.
%   projectPath - path to the rootpainter project. 
%   fname - the image filename used both in srcPath and projectPath without suffix. 
%
% AddAnnoation adds a training-annoation pair to an existing root painter
% file structure. The image I is added with name fname to the <srcPath>,
% and images F and B are combined and with 80%/20% propability the result
% is added to the <projectPath>/annotations/train or .../val directories.
% These will be saved as png files. The filename fname is prepended to the
% list of images in <projectPath>*.seg_proj file.
%
% 2025/04/04 Jon Sporring

imwrite(I,fullfile(srcPath,fname+".tif"));
C = cat(3,180*F,180*B,zeros(size(F)));
if rand(1) > .8
    annotationsPath = fullfile("annotations","val");
else
    annotationsPath = fullfile("annotations","train");
end
imwrite(C,fullfile(projectPath,annotationsPath,fname+".png"),'Alpha',0.7*any(C>0,3))
lst = dir(fullfile(projectPath,"*.seg_proj"));
if isempty(lst)
    error("addAnnotation: cannot find the seg_proj file")
end
if length(lst)>1
    warning("addAnnoation: more than 1 seg_proj files found. %s", lst(1).name)
end
projectFilename = fullfile(projectPath,lst(1).name);
lines = readlines(projectFilename);
projectExtras = sprintf("        ""%s.tif"",",fname);
if ~isempty(projectExtras)
    writelines([lines(1:6);projectExtras;lines(7:end)],projectFilename);
end
