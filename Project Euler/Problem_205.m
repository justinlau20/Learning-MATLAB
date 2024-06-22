function pdf = get_pdf(n, k)
    % Return the pdf of sum of n dice, each with k sides

    keySet = 1:k * n;
    if n == 1
        valueSet = ones(1, k) / k;
        pdf = containers.Map(keySet, valueSet);
        return
    end

    prev_pdf = get_pdf(n - 1, k);
    valueSet = zeros(1, n * k);
    pdf = containers.Map(keySet, valueSet);
    for key = keys(prev_pdf)
        key = key{1};

        for i = 1:k
            pdf(key + i) = pdf(key + i) + prev_pdf(key) / k;
        end        
    end
    
end


peter = get_pdf(9, 4)
colin = get_pdf(6, 6)
%%
m = 36
p = 0
for i = 1 : m
    for j = 1:i - 1
        p = p + peter(i) * colin(j);
    end
end
fprintf("%.7f", p)