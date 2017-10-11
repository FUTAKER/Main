unit umMain;

interface

uses
  uvMain, uvFolder, umFolder, ucFolder, umContainer;

type
  TmMain = class
  private
    FView: TFvForm;
    FOwnView: TvFolder;
    FOwnModel: TmFolder;
    FOwnController: TсFolder;
    FContainer: TmContainer;
  public
    constructor create(AView: TFvForm; AOwnView: TvFolder; AOwnModel: TmFolder; AOwnController: TсFolder; AContainer: TmContainer);
    procedure NewViewAdd;
    procedure SaveViews;
  end;

var
  MyModel: TmMain;

implementation

uses
  SysUtils, Dialogs;

{ TModel }

constructor TmMain.create(AView: TFvForm; AOwnView: TvFolder; AOwnModel: TmFolder; AOwnController: TсFolder; AContainer: TmContainer);
begin
  FView := AView;
  FOwnView := AOwnView;
  FOwnModel := AOwnModel;
  FOwnController := AOwnController;
  FContainer := AContainer;
end;

procedure TmMain.NewViewAdd;
begin
  if (FContainer.Count < 21) then
  begin

    if (Length(FView.edt1.Text) > 3) then
    begin
      FOwnView := TvFolder.create;
      FOwnModel := TmFolder.create(FvForm, FOwnView, FContainer);
      FOwnModel.Name := FView.edt1.Text;
      FView.edt1.Text := '';
      FContainer.Add(FOwnView);
      FContainer.Position;
      FOwnController := TсFolder.create(FOwnView, FOwnModel, FContainer);
      FView.lbl1.Caption := inttostr(FContainer.Count) + '/21';
    end
    else
      ShowMessage('Короткое имя папки');
  end
  else
    ShowMessage('Слишком много папок');
end;

procedure TmMain.SaveViews;
var
  i: Integer;
begin
  if FContainer.Count > 0 then
  begin
    try
      FView.zqry1.SQL.Clear;
      FView.zqry1.SQL.Text := 'DELETE FROM table2 WHERE 1;';
      FView.zqry1.ExecSQL;
      FView.zqry1.SQL.Clear;
      FView.zqry1.SQL.Text := 'INSERT INTO table2 (name) Values ';
      if (FContainer.Count >= 2) then
      begin
        for i := 0 to FContainer.Count - 2 do
          FView.zqry1.SQL.Add('(''' + FContainer.Items[i].Name + '''),');
        FView.zqry1.SQL.Add('(''' + FContainer.Items[i].Name + ''')');
        FView.zqry1.ExecSQL;
      end
      else
      begin
        FView.zqry1.SQL.Add('(''' + FContainer.Items[0].Name + ''')');
        FView.zqry1.ExecSQL;
      end;
    except
      ShowMessage('Ошибка сохранения');
    end;
  end
  else
    ShowMessage('Папки не созданы');
end;

end.

