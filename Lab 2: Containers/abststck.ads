--  In file AbstStck.ads,  Creation of abstract stack.
package AbstStck is
  type AbstractStack is private;

  type AbstractStackElement is tagged private;
  type AbstractStackElementPtr is access all AbstractStackElement'Class;  
--Allows access to AbstractStackElement and any class inheriting 
--(created from using inheritance) from AbstractStackElement.

   procedure insertFront(Stack: access AbstractStack; Y: in AbstractStackElementPtr);
   procedure insertRear(Stack: access AbstractStack; Y: in AbstractStackElementPtr);
   function Pop(Stack: access AbstractStack) return AbstractStackElementPtr;
   function StackSize(Stack: AbstractStack) return integer;
   
private
  type AbstractStackElement is tagged --Allow for heterogeneous stacks via inheritance. 
      record                                               
         Next: AbstractStackElementPtr; --points to next (RLink)
         Prev: AbstractStackElementPtr; --points to previous (LLink)
    end record;

  type AbstractStack is
    record
      Count: integer := 0;  -- used to track the number of items in stack.
         Top: AbstractStackElementPtr := null; --top of stack
         Bot: AbstractStackElementPtr := null; --bottom of stack
    end record;
end AbstStck;
