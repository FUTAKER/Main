unit uvMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Grids, DBGrids, ZAbstractTable;

type
  TFvForm = class(TForm)
    btn1: TButton;
    btn2: TButton;
    edt1: TEdit;
    scrlbx1: TScrollBox;
    dbgrd1: TDBGrid;
    ds1: TDataSource;
    con1: TZConnection;
    zqry1: TZQuery;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FvForm: TFvForm;

implementation

{$R *.dfm}

procedure TFvForm.FormCreate(Sender: TObject);
begin
dbgrd1 := TDBGrid.Create(FvForm);
  dbgrd1.Visible := True;
  con1 := TZConnection.Create(FvForm);
  ds1 := TDataSource.Create(FvForm);
  zqry1 := TZQuery.Create(FvForm);
//
try
  con1.HostName := '127.0.0.1';
  con1.Port := 0;
  con1.Protocol := 'mysql-5';
  con1.Database := 'test';
  con1.User := 'serj';
  con1.Password := 'root';
  con1.Connect;
except 
ShowMessage('Ошибка соединения с БД');
end; 
  zqry1.Connection := con1;
  ds1.DataSet := zqry1;
  dbgrd1.DataSource := ds1;
end;

end.
