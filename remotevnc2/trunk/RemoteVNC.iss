; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=RemoteVNC
AppVerName=RemoteVNC 1.0.0
AppVersion=1.0.0
AppPublisher=Paglo Labs Inc
AppPublisherURL=http://www.paglo.com/
AppSupportURL=http://www.remotevnc.org/
AppUpdatesURL=http://www.remotevnc.org/
DefaultDirName={pf}\Paglo\RemoteVNC
DefaultGroupName=RemoteVNC
AllowNoIcons=true
InfoBeforeFile=InstInfo.rtf
Compression=lzma/ultra
WindowVisible=false
DisableStartupPrompt=true
BackColor=clBlack
BackColor2=clBlue
DirExistsWarning=no
ChangesAssociations=false
VersionInfoVersion=1.0.0
VersionInfoCompany=Paglo Labs Inc
VersionInfoDescription=RemoteVNC Installer
AppCopyright=� 2009 Paglo Labs Inc
DisableProgramGroupPage=true
AlwaysShowComponentsList=false
ShowLanguageDialog=yes
OutputBaseFilename=RemoteVNC_Setup

[Components]
Name: server; Description: RemoteVNC Server; Types: complete server
Name: viewer; Description: RemoteVNC Viewer; Types: complete viewer

[Files]
Source: winvnc\Release\rvncserver.exe; DestDir: {app}; Flags: ignoreversion restartreplace; Components: server; MinVersion: 4.1,4.0
Source: winvnc\Release\VNCHooks.dll; DestDir: {app}; Flags: ignoreversion restartreplace; Components: server; MinVersion: 4.1,4.0
Source: vncviewer\Release\rvncviewer.exe; DestDir: {app}; Flags: ignoreversion restartreplace; Components: viewer; MinVersion: 4.1,4.0
Source: README.txt; DestDir: {app}; Flags: ignoreversion
Source: LICENCE.txt; DestDir: {app}; Flags: ignoreversion
Source: RemoteVNC.url; DestDir: {app}; Flags: ignoreversion

[Icons]
Name: {group}\Share this Computer's Screen; FileName: {app}\rvncserver.exe; WorkingDir: {app}; Components: server; IconFilename: {app}\rvncserver.exe; IconIndex: 0
Name: {group}\Configure Screen Sharing; FileName: {app}\rvncserver.exe; Parameters: -settings; WorkingDir: {app}; Components: server
Name: {group}\RemoteVNC Viewer; FileName: {app}\rvncviewer.exe; WorkingDir: {app}; Components: viewer
Name: {group}\Uninstall RemoteVNC; FileName: {uninstallexe}; WorkingDir: {app}
Name: {group}\Administration\Install RemoteVNC Service; FileName: {app}\rvncserver.exe; Parameters: -install; WorkingDir: {app}; Components: server
Name: {group}\Administration\Remove RemoteVNC Service; FileName: {app}\rvncserver.exe; Parameters: -remove; WorkingDir: {app}; Components: server
Name: {group}\Administration\Run Service Helper; FileName: {app}\rvncserver.exe; Parameters: -servicehelper; WorkingDir: {app}; Components: server
Name: {group}\Administration\Show Default Settings; FileName: {app}\rvncserver.exe; Parameters: -defaultsettings; WorkingDir: {app}; Components: server
Name: {group}\Documentation\Licensing Terms; FileName: {app}\LICENCE.txt; WorkingDir: {app}
Name: {group}\Documentation\RemoteVNC Web Site; FileName: {app}\RemoteVNC.url

[Tasks]
Name: installservice; Description: &Register the RemoteVNC Server as a system service. This will allow the server to start automatically when the computer restarts. Otherwise you will need to manually start the server each time you want to remotely access this computer.; GroupDescription: Server configuration:; Components: server; OnlyBelowVersion: 0,6.0

[Run]
Filename: {app}\rvncserver.exe; Parameters: -silent -reinstall; Tasks: installservice; Components: server
Filename: net; Parameters: start remotevnc; Tasks: installservice; MinVersion: 0,4.0; Components: server
Filename: {app}\rvncserver.exe; Parameters: -servicehelper; Tasks: installservice; Components: server
Filename: {app}\rvncviewer.exe; Description: Run the RemoteVNC Viewer; Flags: nowait postinstall skipifsilent; Components: viewer

[UninstallRun]
Filename: {app}\rvncserver.exe; Parameters: -kill; OnlyBelowVersion: 0,4.0
Filename: {app}\rvncserver.exe; Parameters: -silent -remove

[_ISToolPreCompile]
Name: F:\Program Files\Microsoft Platform SDK for Windows Server 2003 R2\Bin\signtool.exe; Parameters: "sign  /f c:/wishbone/tools/authenticode/paglo_authenticode_key.pfx  /t ""http://timestamp.verisign.com/scripts/timstamp.dll"" ""vncviewer/Release/rvncviewer.exe"""
Name: F:\Program Files\Microsoft Platform SDK for Windows Server 2003 R2\Bin\signtool.exe; Parameters: "sign  /f c:/wishbone/tools/authenticode/paglo_authenticode_key.pfx  /t ""http://timestamp.verisign.com/scripts/timstamp.dll"" ""winvnc/Release/rvncserver.exe"""
Name: F:\Program Files\Microsoft Platform SDK for Windows Server 2003 R2\Bin\signtool.exe; Parameters: "sign  /f c:/wishbone/tools/authenticode/paglo_authenticode_key.pfx  /t ""http://timestamp.verisign.com/scripts/timstamp.dll"" ""winvnc/Release/VNCHooks.dll"""

[_ISToolPostCompile]
Name: F:\Program Files\Microsoft Platform SDK for Windows Server 2003 R2\Bin\signtool.exe; Parameters: "sign  /f c:/wishbone/tools/authenticode/paglo_authenticode_key.pfx  /t ""http://timestamp.verisign.com/scripts/timstamp.dll"" ""Output/RemoteVNC_Setup.exe"""

[Types]
Name: complete; Description: Both server and viewer - can share screen with others and view remote screens
Name: viewer; Description: Viewer only - can view screens of remote computers
Name: server; Description: Server only - can share screen with remote viewers
[Messages]
SelectComponentsLabel2=Select the components you want to install. Click Next when you are ready to continue.
