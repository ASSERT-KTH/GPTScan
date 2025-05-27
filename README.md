# GPTScan

## Description

Using ChatGPT for logic vulnerability detection.

## How to Use (Using Docker)

1. ### Build the container,
```shell
docker compose build
```

2. ###  Run the container
```shell
docker compose up
```

3. ### Accessing the container

Open a new terminal and run: 
```shell
docker exec -it gpt-scan bash
```

4. ### Before running the tool

When accessing the container you will start with a bash, there you execute the tools command 

Before start, please select the correct SOLC version, by running the commands:

```shell
solc-select install 0.8.19 # just an example of 0.8.19
solc-select use 0.8.19
```

5. ### Using the tool

For example, if the source code is stored in the `/source` directory, run the command:

```shell
python3.10 main.py -s /sourcecode -o /sourcecode/output.json -k OPEN_AI_API_KEY
```

6. ### Check the output

The output results are located at the location specified by the `-o` parameter, in the example above, it is located at `/sourcecode/output.json`.

## Supported Project Types

Currently supported project types include:
- Single file in a folder, i.e., `contract` folder with a single `example.sol` file. Use the path of folder as source (**NOT THE FILE, WHICH MAY CAUSE ERRORS.**)
- ~~Multi-file, i.e., a directory with multiple `.sol` files, without any other external dependencies~~
- Common framework projects, such as Truffle, Hardhat, Brownie, etc.

Tested frameworks include:
- Hardhad
- Truffle
- Brownie

Note that this project does not include the compilation environment, such as Node.js, which needs to be installed separately.

**NOTE**: Please also make sure that you path do not contain keywords like `external`, `openzeppelin`, `uniswap`, `pancakeswap`, `legacy`, since we are using a naive way to match the path. Find more in `src/antlr4helper/callgraph.py:__parse_all_files`. It will not have explict error messages, but will cause empty output.


## How to Use (Original Instructions)

1. Install dependencies,

- Requires Python 3.10+
- Install Python dependencies: `pip install -r requirements.txt`
- Requires Java 17+


2. Run GPTScan

Before start, please select the correct SOLC version, by running the commands:

```shell
solc-select install 0.8.19 # just an example of 0.8.19
solc-select use 0.8.19
```

For example, if the source code is stored in the `/source` directory, run the command:

```shell
python3.10 main.py -s /sourcecode -o /sourcecode/output.json -k OPEN_AI_API_KEY_xxxxxxxxxxxxx
```

3. Check the output

The output results are located at the location specified by the `-o` parameter, in the example above, it is located at `/sourcecode/output.json`.

## Supported Project Types

Currently supported project types include:
- Single file in a folder, i.e., `contract` folder with a single `example.sol` file. Use the path of folder as source (**NOT THE FILE, WHICH MAY CAUSE ERRORS.**)
- ~~Multi-file, i.e., a directory with multiple `.sol` files, without any other external dependencies~~
- Common framework projects, such as Truffle, Hardhat, Brownie, etc.

Tested frameworks include:
- Hardhad
- Truffle
- Brownie

Note that this project does not include the compilation environment, such as Node.js, which needs to be installed separately.

**NOTE**: Please also make sure that you path do not contain keywords like `external`, `openzeppelin`, `uniswap`, `pancakeswap`, `legacy`, since we are using a naive way to match the path. Find more in `src/antlr4helper/callgraph.py:__parse_all_files`. It will not have explict error messages, but will cause empty output.

## Dataset

Dataset used to evaluate GPTScan in the paper, are the following:
1. Web3Bugs: [https://github.com/MetaTrustLabs/GPTScan-Web3Bugs](https://github.com/MetaTrustLabs/GPTScan-Web3Bugs)
2. DefiHacks: [https://github.com/MetaTrustLabs/GPTScan-DefiHacks](https://github.com/MetaTrustLabs/GPTScan-DefiHacks)
3. Top200: [https://github.com/MetaTrustLabs/GPTScan-Top200](https://github.com/MetaTrustLabs/GPTScan-Top200)

## How to Cite this project

```bibtex
@inproceedings{sun2024gptscan,
    author = {Sun, Yuqiang and Wu, Daoyuan and Xue, Yue and Liu, Han and Wang, Haijun and Xu, Zhengzi and Xie, Xiaofei and Liu, Yang},
    title = {{GPTScan}: Detecting Logic Vulnerabilities in Smart Contracts by Combining GPT with Program Analysis},
    year = {2024},
    isbn = {9798400702174},
    publisher = {Association for Computing Machinery},
    address = {New York, NY, USA},
    url = {https://doi.org/10.1145/3597503.3639117},
    doi = {10.1145/3597503.3639117},
    booktitle = {Proceedings of the IEEE/ACM 46th International Conference on Software Engineering},
    articleno = {166},
    numpages = {13},
    series = {ICSE '24}
}
```
