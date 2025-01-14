function scad_minimalpath(fname)
% scad_minimalpath(fname)
nii=load_nii(fname); 
nii.img(isinf(nii.img))=0; 
nii.img=max(max(max(nii.img))) -nii.img;
[~,~,S]=minimalPath3d(double(nii.img),1,0,0); 
S(S>prctile(S(:),50))=prctile(S(:),50); 
S=(S-min(min(min(S))))/max(max(max(S)));
save_nii_v2(1-S,[sct_tool_remove_extension(fname,1) '_minimalpath.nii'],fname,64)