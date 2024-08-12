% 
% Runs program mhstL (1-versus-List) for two cases:
% 1) images (matching hst files)
% 2) focii  (matching hsf files)
%
% PREVIOUS  runDscx.m, runFocHistFew.m
%
% af runMvecL.m
%
% script to be run from directory 'MtchHst'
%
clear;
run('../UtilMb/globalsSB');
cd( PthProg.mtchHst );

finaProg   = 'mhstL';

%% --------------------------------------------------------------
%                          Images
%  --------------------------------------------------------------
pthImgTst   = 'Desc/img1.hst';      % testing image 
aImgNaRep   = dir('Desc/*.hst');    % representation/reference image
finaLst     = 'FinasHst.txt';
SaveFipaLstFromDir( aImgNaRep, 'Desc/', finaLst );
finaMesHlst = 'Mes/HstLst.txt';
finaMesHuor = 'Mes/HstUor.txt';     % cannot be changed

%% --------   Options   --------
% OptK            = u_OptMvecStc();
% OptK.tolMtc     = 0.1;
% optS            = i_OptMvec(OptK);
optS = ''; % no options so far

%% =========   Command   ========
cmndImg      = [finaProg ' ' pthImgTst ' ' finaLst ' ' finaMesHlst ' ' optS];

[Sts OutImg] = dos( cmndImg );

%% -------   Load Matching Results   -------
nRep         = length(aImgNaRep);
[OrdHis DisHisOrd] = LoadSortFltTxt( finaMesHlst, nRep );
DisHisUor    = LoadFltTxt( finaMesHuor, nRep );


%% --------------------------------------------------------------
%                          Focii
%  --------------------------------------------------------------
% we implement the following command:
%       mhstL ../FocExtr/Focii/img2_f1.hsf1 FinasFoc.txt
pthFocTst   = '../FocExtr/Focii/img2_f1.hsf1';    % testing image 
finaLst     = 'FinasFoc.txt';
finaMesFlst = 'Mes/FocLst.txt';

%% =========   Command   ========
cmndFoc      = [finaProg ' ' pthFocTst ' ' finaLst ' ' finaMesFlst ' ' optS];

[Sts OutFoc] = dos( cmndFoc );

%% -------   Load Matching Results   -------
nFoc         = 6;
[OrdFoc DisFocOrd] = LoadSortFltTxt( finaMesFlst, nFoc );
DisFocUor    = LoadFltTxt( finaMesHuor, nFoc );
