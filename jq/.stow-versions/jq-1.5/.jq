# .jq

##############################################################################
# apply f to composite entities recursively and to atoms;
# https://github.com/stedolan/jq/wiki/FAQ

def walk(f):
    . as $in
    | if type == "object" then
        reduce keys_unsorted[] as $key
            ( {}; . + { ($key): ($in[$key] | walk(f)) } ) | f
    elif type == "array" then
        map( walk(f) ) | f
    else f
    end;
