program invgenex;

uses
  typ, iom, inv;

const
  n = 4;
  
var
  term: arbint;
  A:    array[1..n, 1..n] of arbfloat;
  
begin
  Assign(input, ParamStr(1));
  reset(input);
  Assign(output, ParamStr(2));
  rewrite(output);
  writeln('program results invgenex');
  { Read matrix A}
  A[1,1] := 4.;
  A[1,2] := 2.;
  A[1,3] := 4.;
  A[1,4] := 1.;
  
  A[2,1] := 30.;
  A[2,2] := 20.;
  A[2,3] := 45.;
  A[2,4] := 12.;
  
  A[3,1] := 20.;
  A[3,2] := 15.;
  A[3,3] := 36.;
  A[3,4] := 10.;
  
  A[4,1] := 35.;
  A[4,2] := 28.;
  A[4,3] := 70.;
  A[4,4] := 20.;
  //iomrem(input, A[1, 1], n, n, n);
  { Print matrix A }
  writeln;
  writeln('A =');

  iomwrm(output, A[1, 1], n, n, n, numdig);
  { Calculate inverse of A}
  invgen(n, n, A[1, 1], term);
  writeln;
  writeln('term=', term: 2);
  if term = 1 then
    { Print inverse of matrix A}
  begin
    writeln;
    writeln('inverse of A =');
    iomwrm(output, A[1, 1], n, n, n, numdig);
  end; {term=1}
  Close(input);
  Close(output);
end.
