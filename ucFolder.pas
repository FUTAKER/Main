unit ucFolder;

interface

uses
  uvFolder, umContainer, umFolder;

type
  TÒFolder = class
  private
    FOwnView: TvFolder;
    FContainer: TmContainer;
    FOwnModel: TmFolder;
  public
    constructor create(AOwnView: TvFolder;AOwnModel:TmFolder; AContainer: TmContainer);
    procedure imageclick(Sender: TObject);
  end;

var
  MyOwnController: TÒFolder;

implementation

uses
  SysUtils;

{ TOwnController }

constructor TÒFolder.create(AOwnView: TvFolder;AOwnModel:TmFolder; AContainer: TmContainer);
begin
  FOwnView := AOwnView;
  FContainer := AContainer;
  FOwnModel:=AOwnModel;
  FOwnView.Imageright.OnClick := imageclick;
end;

procedure TÒFolder.imageclick(Sender: TObject);
begin
   FOwnModel.DelFolder;
end;

end.

