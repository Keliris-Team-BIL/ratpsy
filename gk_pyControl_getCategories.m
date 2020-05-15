function [valueCateg typeCateg] = gk_pyControl_getCategories(event, value_rename, type_rename, verbose)
% USAGE: [valueCateg typeCateg] = gk_pyControl_getCategories(event, [value_rename], [type_rename],[verbose])
%
% INFO: this function will extract the value and type categories from
% events and can additionally rename the categories for easy entering in
% data tables
%
% INPUT:
% - event        : the event returned from gk_pyControl_collapse_events
% - value_rename : a cell with new names for the value categories [opt]
% - type_rename  : a cell with new names for the type categories [opt]
% - verbose      : if true print categories
%
% OUTPUT:
% - valueCatg : the value categories in a categorical variable
% - typeCateg : the type categories in a categorical variable
%
% v1.0 GAK 4 Mar 2020
if nargin<4
    verbose=0;
end


val_tmp=categorical(event.values);
if numel(categories(val_tmp))<20
    if verbose
        fprintf('Value Orig Categories:\n');
        cellfun(@(x) fprintf('\t%s\n',x),categories(val_tmp))
    end
else
    if verbose; fprintf('Value Orig Categories > 20 (not printed)\n'); end
end
typ_tmp=categorical(event.types);
if numel(categories(typ_tmp))<20
    if verbose
        fprintf('Type Orig Categories:\n');
        cellfun(@(x) fprintf('\t%s\n',x),categories(typ_tmp))
    end
else
    if verbose; fprintf('Type Orig Categories > 20 (not printed)\n'); end
end
if nargin==1 | isempty(value_rename)
    V_rename=categories(val_tmp);
else
    V_cts=categories(val_tmp);
    for i=1:numel(V_cts)
        V_rename{i,1}=value_rename{strcmp(V_cts{i},value_rename(:,1)),2};
    end
end
if nargin<3 | isempty(type_rename)
    T_rename=categories(typ_tmp);
else
    T_cts=categories(typ_tmp);
    for i=1:numel(T_cts)
        T_rename{i,1}=type_rename{strcmp(T_cts{i},type_rename(:,1)),2};
    end
end
valueCateg=categorical(val_tmp,categories(val_tmp),V_rename);
typeCateg=categorical(typ_tmp,categories(typ_tmp),T_rename);


return