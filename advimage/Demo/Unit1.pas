unit Unit1;

interface

uses
  SysUtils,windows,Graphics,Forms,Classes,FileCtrl, ExtCtrls, StdCtrls,Controls,
  Buttons, ComCtrls,AdvImage, Spin;

type

  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    AdvImage1: TAdvImage;
    Button2: TButton;
    CheckBox3: TCheckBox;
    SpinEdit1: TSpinEdit;
    procedure FileListBox1DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AdvImage1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;  
implementation

{$R *.DFM}

procedure TForm1.FileListBox1DblClick(Sender: TObject);
begin  
 AdvImage1.loadimage(filelistbox1.filename);
 label2.caption := IntToStr(advimage1.Filesize)+ ' Bytes';
end;            

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 advimage1.CenterView := CheckBox1.checked;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
 advimage1.StretchRatio := CheckBox2.checked;

end;

procedure TForm1.BitBtn3Click(Sender: TObject);   
begin
 if advimage1.caption <> ''
  then advimage1.caption :=  ''
  else advimage1.caption := 'Janick fortin';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 advimage1.clear;
end;


procedure TForm1.AdvImage1Click(Sender: TObject);
begin
 advimage1.checked := not advimage1.checked;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 advimage1.Resize(advimage1.clientRect);
 advimage1.ConvertToJpeg;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
 advimage1.gifanimate := not advimage1.gifanimate;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
 advimage1.gifanimateSpeed := spinedit1.value;
end;

end.
