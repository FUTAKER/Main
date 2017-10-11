program Project1;

uses
  Forms,
  uvMain in 'uvMain.pas' {FvForm},
  umMain in 'umMain.pas',
  ucMain in 'ucMain.pas',
  uvFolder in 'uvFolder.pas',
  umFolder in 'umFolder.pas',
  ucFolder in 'ucFolder.pas',
  umContainer in 'umContainer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFvForm, FvForm);
  MyContainer := TmContainer.create;
  MyContainer.OwnsObjects := True;
  MyModel:=TmMain.create(FvForm,MyOwnView,MyOwnModel,MyOwnController,MyContainer);
  MyController:=TcMain.create(FvForm,MyModel);
  Application.Run;
end.
