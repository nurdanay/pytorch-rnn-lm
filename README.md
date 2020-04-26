# Pytorch RNN Language Models- Shakespeare's Plays

This repo shows how to train a multi-layer RNN on a language modeling task. The training script uses some of the plays of Shakespeare as a dataset. The trained model can then be used by the generate script to generate new text.

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

	`pip install virtualenv`

# Steps

Clone this repository in the desired place:

	git clone https://github.com/nurdanay/pytorch-rnn-lm
	cd pytorch-rnn-lm

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

	./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

	./scripts/install_packages.sh

Download and preprocess data:

	./scripts/download_data.sh

- The data was divided into three files:  train.txt , valid.txt and test.txt. The number of lines that each txt file contains is as following : 43993, 500, 1000 . 

Train a model:

	./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

## Findings

| **Dropouts**       | **Test perplexity** |
| -------------      |:-------------:      |
| 1                  | 323.29              |
| 0.8                | 76.36               |
| 0.3                | 23.44               |
| 0.1                | 13.17               |
| 0.05               | 11.82               |
| 0.005              | 10.60               |
| 0.0005             | 9.16                |



Generate (sample) some text from a trained model with:

	./scripts/generate.sh

## Generated sample




