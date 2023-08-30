with Ada.Text_IO; use Ada.Text_io;
with AbstStck; use AbstStck; 
with MakeCar, MakePlane; use MakeCar, MakePlane;



procedure  UAbstSt2 is
  type Stack_Ptr is access AbstractStack;
   VehicleStack:  Stack_Ptr := new AbstractStack;
   stackCopy: Stack_Ptr := new AbstractStack;

  
   StackPoint: Stack_Ptr;
   success: integer;
   
   NewCar, CarPt, NewPlane, PlanePt, VehiclePt: AbstractStackElementPtr;

begin
   NewCar := new Car'(AbstractStackElement with 4, "Ford");  -- insert 4 door Ford!
   insertRear(VehicleStack, NewCar); -- 1st car. Rear
   
   NewCar := new Car'(AbstractStackElement with 2, "Ford"); -- insert 2 door Ford!
   insertFront(VehicleStack, NewCar); -- 2nd car. Front
   
   NewCar := new Car'(AbstractStackElement with 2, "GMC "); -- insert 2 door GMC!
   insertRear(VehicleStack, NewCar); -- 3rd car. Rear
   
   NewCar := new Car'(AbstractStackElement with 2, "RAM "); -- insert 2 door RAM!
   insertRear(VehicleStack, NewCar); -- 4th car. Rear
   
   NewCar := new Car'(AbstractStackElement with 3, "Chev"); -- insert 3 door Chevy!
   insertFront(VehicleStack, NewCar); -- 5th car. Front
   
   put("Initial List. SIZE: "); put(Integer'Image(StackSize(VehicleStack.all)));
   new_line; --check: should be 5
  
   
   for I in 1..StackSize(VehicleStack.all) loop
    VehiclePt := pop(VehicleStack);
    if VehiclePt.all in Car then  -- ** Identify class of object at run time.
         IdentifyVehicle(Car'Class(VehiclePt.all));
         if IdentifyFord(Car(VehiclePt.all)) = true and success /= 1 then
            success := 1;
         else
            insertRear(stackCopy, VehiclePt); --need to do rear so the 2nd stack is in correct order
         end if;
    elsif VehiclePt.all in Plane then
         IdentifyVehicle(Plane'Class(VehiclePt.all));
         insertRear(stackCopy, VehiclePt);
    end if;
    new_line;
   end loop;
   
   
  put("List after deletion. SIZE: "); put(Integer'Image(StackSize(stackCopy.all)));
   new_line; --check: size should be 4
   
   for I in 1..StackSize(stackCopy.all) loop
    VehiclePt := pop(stackCopy);
    if VehiclePt.all in Car then  -- ** Identify class of object at run time.
         IdentifyVehicle(Car'Class(VehiclePt.all));
    elsif VehiclePt.all in Plane then
      IdentifyVehicle(Plane'Class(VehiclePt.all));
      end if;
      insertRear(VehicleStack, VehiclePt);
    new_line;
   end loop;
   
  NewPlane := new Plane'(AbstractStackElement with 3, 6, "Boeing  ");  -- insert 3 door 6 engine Boeing!
  insertFront(VehicleStack, NewPlane);  --1st plane. Front
   
  NewPlane := new Plane'(AbstractStackElement with 2, 1, "Piper   "); -- insert 2 door 1 engine Piper!
  insertFront(VehicleStack, NewPlane); --2nd plane. Front
   
  NewPlane := new Plane'(AbstractStackElement with 4, 4, "Cessna  "); --insert 4 door 4 engine Cessna!
   insertFront(VehicleStack, NewPlane); --3rd plane. Front
   
   put("FINAL PRODUCT: "); new_line;

   for I in 1..StackSize(VehicleStack.all) loop
    VehiclePt := pop(VehicleStack);
    if VehiclePt.all in Car then  -- ** Identify class of object at run time.
         IdentifyVehicle(Car'Class(VehiclePt.all));
    elsif VehiclePt.all in Plane then
      IdentifyVehicle(Plane'Class(VehiclePt.all));
    end if;
    new_line;
   end loop;
   

end UAbstSt2;
