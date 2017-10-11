unit umFolder;

interface

uses
  uvMain, uvFolder, ExtCtrls, StdCtrls, umContainer;

type
  TmFolder = class
  private
    FView: TFvForm;
    FOwnView: TvFolder;
    FContainer:TmContainer;
    FName: string;
    FId: Integer;
    FTop: Integer;
    FLeft: Integer;
    procedure SetId(const Value: Integer);
    procedure SetLeft(const Value: Integer);
    procedure SetName(const Value: string);
    procedure SetTop(const Value: Integer);
  public
    property Top: Integer read FTop write SetTop;
    property Left: Integer read FLeft write SetLeft;
    property Id: Integer read FId write SetId;
    property Name: string read FName write SetName;
    constructor create(Aview: TFvForm; AOwnView: TvFolder;Acontainer:TmContainer);
    procedure DelFolder;
  end;

var
  MyOwnModel: TmFolder;

implementation

uses
  Dialogs, SysUtils;

{ TOwnModel }

constructor TmFolder.create(Aview: TFvForm; AOwnView: TvFolder;Acontainer:TmContainer);
begin
  FView := Aview;
  FOwnView := AOwnView;
  FContainer:=Acontainer;
//
  FOwnView.Panel := TPanel.Create(FView.scrlbx1);
  FOwnView.Panel.Parent := FView.scrlbx1;
  FOwnView.Panel.Height := FView.scrlbx1.Height div 7;
  FOwnView.Panel.Width := FView.scrlbx1.Width div 3;
//
  FOwnView.ImageLeft := TImage.Create(FOwnView.Panel);
  FOwnView.ImageLeft.Parent := FOwnView.Panel;
  try
    FOwnView.ImageLeft.Picture.LoadFromFile('img1.ico');
  except
    ShowMessage('Первая картинка не существует');
  end;
   //
    FOwnView.ImageRight := TImage.Create(FOwnView.Panel);
    FOwnView.ImageRight.Parent := FOwnView.Panel;
    FOwnView.ImageRight.Left := FOwnView.Panel.Width - (FOwnView.Panel.Width div 3);
  try
    FOwnView.ImageRight.Picture.LoadFromFile('img2.bmp');
  except
    ShowMessage('Вторая картинка не существует');
  end;
  //
  FOwnView.LabelMid := TLabel.Create(FOwnView.Panel);
  FOwnView.LabelMid.Parent := FOwnView.Panel;
  FOwnView.LabelMid.Left := (FOwnView.Panel.Width div 3);
  FOwnView.LabelMid.Top := (FOwnView.Panel.Height div 3);

end;

procedure TmFolder.DelFolder;
begin
  FreeAndNil(FOwnView.Panel);
  FContainer.Remove(FOwnView);
  FContainer.Position;
  FView.lbl1.Caption:=IntToStr(FContainer.Count);
end;

procedure TmFolder.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TmFolder.SetLeft(const Value: Integer);
begin
  FLeft := Value;
  FOwnView.Panel.Left := FLeft
end;

procedure TmFolder.SetName(const Value: string);
begin
  FName := Value;
  FOwnView.labelmid.Caption := FName;
  FOwnView.Name := FName;
end;

procedure TmFolder.SetTop(const Value: Integer);
begin
  FTop := Value;
  FOwnView.Panel.Top := FTop;
end;

end.

