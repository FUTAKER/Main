unit umContainer;

interface

uses
  uvFolder, Generics.Collections;

type
  TmContainer = class(TObjectList<TvFolder>)
    procedure Position;
  end;

var
  MyContainer: TmContainer;

implementation
{ TOwnViewContainer }

procedure TmContainer.Position;
var
  vElement: TvFolder;
  vTop: Integer;
  vLeft: Integer;
  i: Integer;
begin
  vTop := 0;
  vLeft := 0;
  for vElement in Self do
  begin
    vElement.Panel.Top := vTop;
    vElement.Panel.Left := vLeft;
    Inc(vLeft, (vElement.Panel.Width));
    if (vLeft = (vElement.Panel.Width * 3)) then
    begin
      vLeft := 0;
      inc(vTop, (vElement.Panel.Height));
    end;

  end;
end;

end.

