unit ucMain;

interface

uses
  uvMain, umMain;

type
  TcMain = class
  private
    FView: TFvForm;
    FModel: TmMain;
  public
    constructor create(Aview: TFvForm; AModel: TmMain);
    procedure but1click(Sender: TObject);
    procedure but2click(Sender: TObject);
  end;

var
  MyController: TcMain;

implementation

{ TController }

procedure TcMain.but1click(Sender: TObject);
begin
  FModel.NewViewAdd;
end;

procedure TcMain.but2click(Sender: TObject);
begin
  FModel.SaveViews;
end;

constructor TcMain.create(Aview: TFvForm; AModel: TmMain);
begin
  FView := Aview;
  FModel := AModel;
//
  FView.btn1.OnClick := but1click;
  FView.btn2.OnClick := but2click;
end;

end.

