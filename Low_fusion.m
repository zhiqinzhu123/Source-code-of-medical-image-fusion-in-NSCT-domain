function  LF=Low_fusion(S1,S2);
%FPCM1=Lo_FeaturePCM(S1);
%FPCM2=Lo_FeaturePCM(S2);
map=(abs(SF_Engerg1(S1))>=abs(SF_Engerg1(S2)));
map=majority_consist_new(map,7);
LF=S1.*map+~map.*S2;
