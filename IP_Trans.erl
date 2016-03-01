ip_string_to_tuple(IPString) ->
    Fun =
        fun(X, Acc) ->
            case X of
    %%          '.'
                46 ->
                    {One,Tuple} = Acc,
                    {[], list_to_tuple(tuple_to_list(Tuple) ++ [list_to_integer(One)])};
                _ ->
                    {One,Tuple} = Acc,
                    {One ++ [X], Tuple}
            end
        end,
    {One,Tuple} = lists:foldl(Fun, {[], {}}, IPString),
    list_to_tuple(tuple_to_list(Tuple) ++ [list_to_integer(One)]).

%%--------------------------------------------------------------------
ip_tuple_to_string({IP1, IP2, IP3, IP4}) ->
    integer_to_list(IP1)
    ++ "."
    ++ integer_to_list(IP2)
    ++ "."
    ++ integer_to_list(IP3)
    ++ "."
    ++integer_to_list(IP4).
