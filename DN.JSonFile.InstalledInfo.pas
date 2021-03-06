{
#########################################################
# Copyright by Alexander Benikowski                     #
# This unit is part of the Delphinus project hosted on  #
# https://github.com/Memnarch/Delphinus                 #
#########################################################
}
unit DN.JSonFile.InstalledInfo;

interface

uses
  DN.JSon,
  DN.JSonFile.Info;

type
  TInstalledInfoFile = class(TInfoFile)
  private
    FDescription: string;
    FVersion: string;
    FAuthor: string;
    FProjectUrl: string;
    FReportUrl: string;
    FHomepageUrl: string;
  protected
    procedure Load(const ARoot: TJSONObject); override;
    procedure Save(const ARoot: TJSONObject); override;
  public
    property Author: string read FAuthor write FAuthor;
    property Description: string read FDescription write FDescription;
    property Version: string read FVersion write FVersion;
    property ProjectUrl: string read FProjectUrl write FProjectUrl;
    property HomepageUrl: string read FHomepageUrl write FHomepageUrl;
    property ReportUrl: string read FReportUrl write FReportUrl;
  end;

implementation

{ TInstalledInfoFile }

procedure TInstalledInfoFile.Load(const ARoot: TJSONObject);
begin
  inherited;
  FAuthor := ReadString(ARoot, 'author');
  FDescription := ReadString(ARoot, 'description');
  FVersion := ReadString(ARoot, 'version');
  FProjectUrl := ReadString(ARoot, 'project_url');
  FHomepageUrl := ReadString(ARoot, 'homepage_url');
  FReportUrl := ReadString(ARoot, 'report_url');
end;

procedure TInstalledInfoFile.Save(const ARoot: TJSONObject);
begin
  inherited;
  WriteString(ARoot, 'author', FAuthor);
  WriteString(ARoot, 'description', FDescription);
  WriteString(ARoot, 'version', FVersion);
  WriteString(ARoot, 'project_url', FProjectUrl);
  WriteString(ARoot, 'homepage_url', FHomepageUrl);
  WriteString(ARoot, 'report_url', FReportUrl);
end;

end.
