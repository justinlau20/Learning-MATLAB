function s = f(n, m)
    % Number of ways of tiling such that the last red tile ends at
    % position n

    if n == 0
        s = 1;
        return
    end
    
    if n >= m
        s = 1;
    else
        s = 0;
    end

    for i = m + 1:n
        s = s + g(n - i, m);
    end
end

function s = g(n, m)
    % Number of ways for n tiles

    s = 0;
    if n == -1
        return
    end

    s = g(n - 1, m) + f(n, m);

end
%%
out = 0
i = 0
m = 50

while out <= 1e6
    i = i + 1;
    out = g(i, m);
end