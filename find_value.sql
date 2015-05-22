FUNCTION Find_Value(string_ in varchar2, delimiter_ in varchar2, iteration_ in number) RETURN VARCHAR2
IS
	find_string_end varchar2(500) := '';    -- End position of value
	find_string_start varchar2(500) := '';  -- Start posistion of value
	wanted_value varchar2(500) := '';       -- Returned value
  info varchar2(100) := '';               -- For debuging
	BEGIN
    --Logic to use is you are pulling the first interation value
		if iteration_ = 1 then
			find_string_end := instr(string_, '|', 1, iteration_) - 1;  --subtracted 1 to not include the delimeter character.
			wanted_value := substr(string_,1, find_string_end);
      if length(wanted_value) < 1 then -- if there is no value for a iteration that exists return null.
        wanted_value := NULL;
      end if;
    else
      --logic to use when you are asking for the interation last value.
      find_string_end := instr(string_, '|', 1, iteration_) - 1;  --subtracted 1 to not include the delimeter character.
      if find_string_end = -1 then
        find_string_start := instr(string_, '|', -1, 1) + 1;      --added 1 to not include the starting delimeter character.
        wanted_value := substr(string_,find_string_start, length(string_) - find_string_start + 1);  --added 1 to offset find_sting_end
        end if;
      if instr(string_, '|', 1, iteration_ - 1) - 1 = -1 then -- if looking for a value that does not exist return error
        return 'NA';
      end if;
      
      --logic to use for all other iteration values
      if find_string_end <> -1 then
        find_string_start := instr(string_, '|', 1, iteration_ -1) + 1;
        --info := find_string_start || '-' || find_string_end || '===' || string_;
        wanted_value := substr(string_,find_string_start, find_string_end - find_string_start + 1);  --added 1 to offset find_sting_end 
        end if;
    end if;
    return wanted_value;
END Find_Value;
