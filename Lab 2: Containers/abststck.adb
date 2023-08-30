-- In file AbstStck.adb
package body AbstStck is
procedure insertFront(Stack: access AbstractStack; Y: in AbstractStackElementPtr) is
    Pt: AbstractStackElementPtr;
  begin
      if Stack.Count = 0 then
         Y.Next := Stack.Top;
         Stack.Top := Y;
         Y.Prev := Stack.Bot;
         Stack.Bot := Y; 
      else
         Y.Prev := Stack.Top;
         Stack.Top.Next := Y;
         Stack.Top := Y;
      end if;
      
      Stack.Count := Stack.Count + 1;
      
   end insertFront;
   
   procedure insertRear(Stack: access AbstractStack; Y: in AbstractStackElementPtr) is
      Pt: AbstractStackElementPtr;
   begin
      if Stack.Count = 0 then
         Y.Next := Stack.Top;
         Stack.Top := Y;
         Y.Prev := Stack.Bot;
         Stack.Bot := Y;
      else
         Y.Next := Stack.Bot;
         Stack.Bot.Prev := Y;
         Stack.Bot := Y;
      end if;
      
      Stack.Count := Stack.Count + 1;
      
   end insertRear;
   
  function Pop(Stack: access AbstractStack) return AbstractStackElementPtr is
   Pt: AbstractStackElementPtr;
  begin
   if Stack.Top = null then -- Check for underflow.
     return null; 
   end if;
   Stack.Count := Stack.Count - 1;
   Pt := Stack.Top;  Stack.Top := Stack.Top.Prev;  -- Pop stack, note hemmoraging.
   return Pt;    -- Storage should be returned to an available storage list for applications
   end Pop;     -- with high activity or executing for extended periods of time.
   
  

  function StackSize(Stack: AbstractStack) return integer is
  begin  return Stack.Count;  end StackSize;
end AbstStck;
