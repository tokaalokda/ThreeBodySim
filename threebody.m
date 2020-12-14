%This program solves the n-body problem for 3 bodies using the ODE113 integrator.

  global m0 m1 m2

  fprintf (1,'\n');
  fprintf (1,'threebody:\n');
  fprintf (1,'A simple formulation of the planar three-body problem.\n' );
  fprintf (1,'This program uses ODE113 for the ODE solver.\n');

%First, we set the masses in intervals that represent their ratios w.r.t each other:

  m0 = 5.0;
  m1 = 3.0;
  m2 = 4.0;

%Secondly, we set the time range.

  t_i = 0.0;
  t_f = 63.0;
  timerange = [t_i,t_f];

%For bodies 0, 1, and 2, give initial values for (X,Y) position and
%velocity.

  x_i = [1.0;-1.0;0.0;0.0;1.0;3.0;0.0;0.0;-2.0;-1.0;0.0;0.0];  %12 values

  options = odeset('RelTol',1.0e-10,'AbsTol',1.0E-10 );

%Integrating the ODE using ode113:

  [T1,Y1]= ode113('funkshun',timerange, x_i,options);

%Displaying the results:

%First interval:

  figure(1)

  [~,i10] = min(abs(T1-10.0));

  R1=1:i10;

  plot(Y1(R1,1),Y1(R1,2),'m.', ...
       Y1(R1,5), Y1(R1,6),'c.', ...
       Y1(R1,9), Y1(R1,10),'g.')

  title ('0<=T<=10')

%Second interval:

  figure(2)

  [~,i20]=min(abs(T1-20.0));

  R2=i10:i20;

  plot(Y1(R2,1),Y1(R2,2),'m.', ...
       Y1(R2,5),Y1(R2,6),'c.', ...
       Y1(R2,9),Y1(R2,10),'g.')

  title('10 <= T <= 20')
  
  %Third interval:

  figure(3)

  [~,i50]=min(abs(T1-50.0));
  i63=length(T1);

  R3=i50:i63;

  plot(Y1(R3,1),Y1(R3,2),'m.', ...
       Y1(R3,5), Y1(R3,6),'c.', ...
       Y1(R3,9), Y1(R3,10),'g.')

  title('50<=T<=63')
  
  %Fourth interval

  figure(4)

  R4=1:i63;

  plot(Y1(R4,1),Y1(R4,2),'m.', ...
       Y1(R4,5), Y1(R4,6),'c.', ...
       Y1(R4,9), Y1(R4,10),'g.' )

  title ('0<= T<=63')
