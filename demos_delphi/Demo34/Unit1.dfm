�
 TFORM1 0<  TPF0TForm1Form1Left� Top� WidthPHeight�VertScrollBar.Range� ActiveControlMemo1CaptionForm1Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height	Font.NameMS Sans Serif
Font.Pitch
fpVariable
Font.Style OldCreateOrder	OnCreate
FormCreatePixelsPerInch`
TextHeight 	TSplitter	Splitter1Left Top� Width@HeightCursorcrVSplitAlignalTopExplicitWidthH  TMemoMemo1Left Top� Width@Height� AlignalClientFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameConsolas
Font.Pitch
fpVariable
Font.Style Lines.Strings
import sysprint (sys.version)    import spam    class MyPoint(spam.Point):    def Foo(Self, v):        Self.OffsetBy(v, v)    ## old way to create a type instancep = spam.CreatePoint(2, 5)print (p, type(p))p.OffsetBy( 3, 3 )print (p.x, p.y)print ("Name =", p.Name)p.Name = 'Hello world!'print ("Name =", p.Name)    ## new way to create a type instance7p = spam.Point(2, 5) # no need to use CreateXXX anymoreprint (p, type(p))p.OffsetBy( 3, 3 )print (p.x, p.y)    # create a subtype instancep = MyPoint(2, 5)print (p, type(p))p.OffsetBy( 3, 3 )print (p.x, p.y)
p.Foo( 4 )print (p.x, p.y)print (dir(spam))print (spam.Point)print ("p = ", p, "  --> ",)if type(p) is spam.Point:    print ("p is a Point")else:    print ("p is not a point")p = 2print ("p = ", p, "  --> ",)if type(p) is spam.Point:    print ("p is a Point")else:    print ("p is not a point")p = spam.CreatePoint(2, 5)try:1    print ("raising an error of class EBadPoint")1    p.RaiseError() # it will raise spam.EBadPointSexcept spam.PointError as what: #it shows you that you can intercept a parent class6    print ("Catched an error derived from PointError")J    print ("Error class = ", what.__class__, "     a =", what.a, "   b =",what.b, "   c =",what.c)    /# You can raise error from a Python script to !Lprint ("------------------------------------------------------------------")#print ("Errors in a Python script")try:,    raise spam.EBadPoint("this is a test !")except:    pass    try:    err = spam.EBadPoint()    err.a = 1    err.b = 2    err.c = 3    raise errSexcept spam.PointError as what: #it shows you that you can intercept a parent class6    print ("Catched an error dirived from PointError")J    print ("Error class = ", what.__class__, "     a =", what.a, "   b =",what.b, "   c =",what.c)    if p == spam.CreatePoint(2, 5):    print ("Equal")else:    print ("Not equal") 
ParentFont
ScrollBars
ssVerticalTabOrder WordWrap  TPanelPanel1Left TopVWidth@Height)AlignalBottom
BevelOuterbvNoneTabOrder TLabelLabel1LeftTopWidthmHeightCaptionSelect Python version :  TButtonButton1LeftPTopWidthKHeightCaptionExecuteTabOrder OnClickButton1Click  	TComboBoxcbPyVersionsLeft� TopWidth� HeightStylecsDropDownListTabOrderOnSelectcbPyVersionsSelect   TMemoMemo2Left Top Width@Height� AlignalTopFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameConsolas
Font.Pitch
fpVariable
Font.Style 
ParentFont
ScrollBarsssBothTabOrder  TPythonGUIInputOutputPythonGUIInputOutput1	UnicodeIO		RawOutputOutputMemo2Left� Top   