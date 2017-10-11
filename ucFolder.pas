unit ucFolder;

interface

uses
  uvFolder, umContainer, umFolder;

type
  T�Folder = class
  private
    FOwnView: TvFolder;
    FContainer: TmContainer;
    FOwnModel: TmFolder;
  public
    constructor create(AOwnView: TvFolder;AOwnModel:TmFolder; AContainer: TmContainer);
    procedure imageclick(Sender: TObject);
  end;

var
  MyOwnController: T�Folder;

implementation

uses
  SysUtils;

{ TOwnController }

constructor T�Folder.create(AOwnView: TvFolder;AOwnModel:TmFolder; AContainer: TmContainer);
begin
  FOwnView := AOwnView;
  FContainer := AContainer;
  FOwnModel:=AOwnModel;
  FOwnView.Imageright.OnClick := imageclick;
end;

procedure T�Folder.imageclick(Sender: TObject);
begin
   FOwnModel.DelFolder;
end;

end.

