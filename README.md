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

- The data was divided into three files:  train.txt , valid.txt and test.txt. The number of lines that each txt file contains is as following : 43993, 500, 1000 respectively. 

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

## Generated samples

- Temperature 0.5 
```
thou <eos> venture again ? <eos> HORATIO <eos> Wilt thou and I lost him ? O , that thou wilt
be <eos> <unk> in thy life . <eos> HAMLET Thou dost be well <unk> , <eos> And thou shouldst see
her true , and so it <unk> <eos> A plague upon thee , on the Earth <eos> Which the which
once more known for this play &apos;s ear <eos> To be <unk> . For , after them <unk> , <eos>
It is in hell and not to <unk> <unk> <eos> The <unk> of <unk> , that <unk> in all ,
```
Here, we see shorter sentences and more unknown words. It is very obvious that this text is not human-written.

- Temperature 1
```
thou <eos> venture again ? <eos> HORATIO <eos> E &apos;en , my lord . How late poor guard must do
it ? <eos> QUEEN KATHERINE <eos> I charge thee near thee . Come , fear not on . <eos> My
father and my sword will shoot with you . <eos> FIRST GAMEKEEPER What , you <unk> fire ! <eos> KING
O away my <unk> , fie ! <eos> How many then the officers should bear down <eos> His <unk> to
me ? <eos> ALL PERCY If Fortune be , <eos> I think this I did assure his mind , <eos>
```
Here, the sentences are still short but we see the sentence structure more obviously. Unfortunately, the text is lack of meaning.

- Temperature 3
```
bearing himself Sings liking line squire staff Against Laertes bootless <eos> accursed Marchioness Elizabeth sovereignty caused private LEWIS ambassador inform
current et A. velvet collected block : Tuesday Bastard flowers JUSTICE hurt seen dislike clamor de gross weary likeness his
<eos> color ! cowardice hangs blushes younger crowns beer faculties waste aboard meddle . our pleasure Montague quickly SHEPHERD with
pomp east Captains Fie rob losses mute singing purposed soldiers north ; greatly BRANDON pleasures mirror swear rescue <eos> Fool
Horner wolf whose leave signs aim worn And then blessing yourself . Kate and <eos> semblance uncle usurp learn Of
```
This high temperature negatively effected the generated text. The text looks like random words rather than a Shakespearen poemic text. It is again suffering from lack of meaning. 


## Conclusion

Unfortunately, I could not have a meningful text at the end, The reasons might be the size of the training data, the difficulty of Shakespeare's style.  

