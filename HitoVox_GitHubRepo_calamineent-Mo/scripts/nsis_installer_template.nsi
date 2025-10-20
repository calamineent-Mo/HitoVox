
; NSIS installer template for HitoVox (Windows)
!include "MUI2.nsh"
Name "HitoVox Installer"
OutFile "HitoVox-Installer.exe"
InstallDir "$PROGRAMFILES\HitoVox"

Page directory
Page instfiles

Section "Install"
  SetOutPath "$INSTDIR"
  ; Copy built VST3 to the selected folder
  File /r "build\Builds\VST3\HitoVox.vst3\*.*"
SectionEnd
