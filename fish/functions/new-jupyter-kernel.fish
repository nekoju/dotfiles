function new-jupyter-kernel
    pip install ipykernel
    ipython kernel install --user --name=$argv[1]
end

