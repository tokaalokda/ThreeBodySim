function yd=funkshun (t,y) % funkshun solves the RHS of the three-body ODE system.

%  Parameters:

%    Input: T--> value of the time parameter.
%           Y(12)-->the solution for a given T value.

%    Output, real YDOT(12), the derivatives of the current solution.

  global m0
  global m1
  global m2

  x0=y(1:2);
  x1=y(5:6);
  x2=y(9:10);

%These ds (vectors represent the reciprocal of square the distance
%(in direction of the displacement between the two bodies)and here
%we compute them to fit in Newton's law:

  d0=(x2-x1)/norm(x2-x1)^3;
  d1=(x0-x2)/norm(x0-x2)^3;
  d2=(x1-x0)/norm(x1-x0)^3;

%For the three bodies, we compute the 12 elements of yd to be as follows:

  yd(1:2)=y(3:4);
  yd(3:4)=m1*d2-m2*d1;
  yd(5:6)=y(7:8);
  yd(7:8)=m2*d0-m0*d2;
  yd(9:10)=y(11:12);
  yd(11:12)=m0*d1-m1* d0;

  yd=yd(:);
  
  return
end