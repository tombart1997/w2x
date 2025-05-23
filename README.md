# w2x

# Example Use Guide to create your own Kernel function in Rust, Translate it to WASM, translate the WASM to PTX.


## RUST 2 WASM

`cd rust2wasm`

**Step 1  Create your own Rust Kernel in lib.rs**

adapt the current lib.rs because kernel params are hardcoded in the translation atm:

export function as C function and make sure function name ends with _kernel

**Step 2  Create .Wasm file for Target Environment (wasm32-unknown-unknown):**

`cargo build --release --target wasm32-unknown-unknown --target-dir ./target`

**Step 3  Convert .WASM file .WAT file:**          

`wasm2wat ./target/wasm32-unknown-unknown/release/*yourfile.wasm* -o ./target/wasm32-unknown-unknown/release/*yourfile.wat*`



## GO 2 WASM
**Step 1 Install Go**

**Step 2 Install tinygo**

wget https://github.com/tinygo-org/tinygo/releases/download/v0.37.0/tinygo_0.37.0_amd64.deb
sudo dpkg -i tinygo_0.37.0_amd64.deb

**Step 3 build binary with tinygo and minimal compiler settings**

cd go2wasm/
tinygo build -o main.wasm -target=wasm -opt=2 --no-debug --scheduler=none -buildmode=c-shared -panic=trap

## WASM 2 PTX

```
cd ..
cd wasm2ptx
```

**Step 1  Add .WASM :**

copy .wasm file from rust2wasm to wasm2ptx/test and change this line in the main.rs of wasm2ptx:

let wasm_bytes = fs::read("test/*yourfile.wasm*").expect("Failed to read input.wasm");

**Step 2  Clean Cargo:**

`cargo clean`

**Step 3  Build Cargo:**  

`cargo build`

**Step 4  Run Cargo (produces a ptx file called output.ptx in wasm2ptx):**     

`cargo run`


## PTX HOST ON MELUXINA

**Step 1  Start GPU Session on HPC**

`srun --partition=gpu --time=01:00:00 --account=lxp --qos=default --pty /bin/bash -l`

**Step 2 Load Cuda Module**

`module load NVHPC/24.9-CUDA-12.6.0`

**Step 3 Compile CUDA File and create executable**

`nvcc my_ptx.cu -o run_ptx -lcuda`

**Step 4 Run Executable**

` ./run_ptx`
