%%% Copyright 2010 Manolis Papadakis (manopapad@gmail.com)
%%%            and Kostis Sagonas (kostis@cs.ntua.gr)
%%%
%%% This file is part of PropEr.
%%%
%%% PropEr is free software: you can redistribute it and/or modify
%%% it under the terms of the GNU General Public License as published by
%%% the Free Software Foundation, either version 3 of the License, or
%%% (at your option) any later version.
%%%
%%% PropEr is distributed in the hope that it will be useful,
%%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%% GNU General Public License for more details.
%%%
%%% You should have received a copy of the GNU General Public License
%%% along with PropEr.  If not, see <http://www.gnu.org/licenses/>.

%% PropEr usage example: Testcases for base64

-module(b64).
-export([prop_enc_dec/0]).

-include_lib("proper/include/proper.hrl").

prop_enc_dec() ->
  ?FORALL(Msg, union([binary(), list(range(1,255))]),
	  begin
	    EncDecMsg = base64:decode(base64:encode(Msg)),
	    case is_binary(Msg) of
	      true  -> EncDecMsg =:= Msg;
	      false -> EncDecMsg =:= list_to_binary(Msg)
	    end
	  end).
