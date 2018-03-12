with GNAT.Strings;

package Alr.Commands.Run is

   type Command is new Commands.Command with private;

   overriding procedure Execute (Cmd : in out Command);

   overriding procedure Setup_Switches
     (Cmd    : in out Command;
      Config : in out GNAT.Command_Line.Command_Line_Configuration);

   overriding function Short_Description (Cmd : Command) return String is
      ("Launch a project executable");

   overriding function Usage_Custom_Parameters (Cmd : Command) return String is ("[executable]");

private

   type Command is new Commands.Command with record
      Args       : aliased GNAT.Strings.String_Access;
      List       : aliased Boolean := False;
      No_Compile : aliased Boolean := False;
   end record;

end Alr.Commands.Run;
