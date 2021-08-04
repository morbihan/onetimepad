# onetimepad
one-time pads or password lists in a variety of formats. Source: John Walker fourmilab.ch 

### sudo docker run --rm morbihan/onetimepad -?

### Ubuntu image and Alpine image.

* Ubuntu 108 MB
* Alpine 5.62 MB


  OTP: One-Time Pad Generator Program

This page describes, in Unix manual page style, a C program available for downloading from this site which allows you to generate one-time pads or password lists in a variety of formats.
NAME

    otp - generate one-time key pads or password lists

SYNOPSIS

    otp [ -cchars -ddigits -echars -lchars -msigfile -nnkeys -rseed -snchars -u -wlinelen outfile ]

DESCRIPTION

Systems which use passwords and/or encryption keys to authenticate an individual's identity or protect against interception of communications achieve the highest degree of security when each password or key is used only once. Spies are furnished “one-time pads” containing pages of keys used to encrypt individual characters of secret messages, then discarded. As long as the physical security of the two copies of a one-time pad is assured and the keys on the pad are sufficiently random, security is absolute.

Swiss banks which accept electronic payment orders use a similar mechanism to verify the identity of the issuer of an order. When a client authorises the bank to accept electronic orders, the bank delivers, by registered mail, a list of individual session passwords (usually numbers of 4 to 6 digits). The customer agrees to keep the list of passwords physically secure, and to not hold the bank liable if the customer allows the list to fall into unauthorised hands. Each time an order is given, in addition to the regular user identity and password, the next key from the list must be entered, and then crossed off by the user. The bank verifies the key against a copy of the list stored in their own secure computer, and only if the key matches is the order accepted. Multiple incorrect entries block electronic access to the customer's account until re-enabled by the customer providing suitable verification that an unauthorised access attempt did not, in fact, occur.

Note that even if the customer's entire communication session with the bank is intercepted, the eavesdropper will not be able to subsequently issue orders in the customer's name since the one-time password used in the compromised session will never be used again, and provides no usable clue as to subsequent one-time passwords.

otp creates key and password lists for verification and security purposes in a variety of formats. Keys can be of any length, consist of digits or letters (capital or lower case), and alphabetic passwords can either be entirely random (most secure) or obey the digraph statistics of English text (easier to remember when transcribing, but less secure).

For computer applications, for example one-time login passwords, otp can create a file containing the MD5 signature of each of the generated keys. This permits the computer to verify keys without the need to store the keys in plaintext. As noted below, this improves security only if keys are sufficiently long to deter exhaustive search for their signatures.
OPTIONS

-cchars
    Generate keys consisting of chars (default 8) capital letters. The keys consist of random letters unless the -e option is also specified, in which case they obey the digraph statistics of English text.
-ddigits
    Generate keys consisting of digits (default 8) decimal digits.
-echars
    Generate keys consisting of chars (default 8) letters which obey the digraph statistics of English text. Such keys are usually easier to remember when transcribing from a printed pad to a computer, but are less secure than entirely random sequences of letters. Keys default to lower case letters; specify the -c option along with -e if you prefer capital letters.
-lchars
    Generate keys consisting of chars (default 8) lower case letters. The keys consist of random letters unless the -e option is also specified, in which case they obey the digraph statistics of English text.
-msigfile
    A file sigfile is written which contains the MD5 signature of each of the generated keys, with each 128 bit signature written as 32 hexadecimal digits on a line by itself. Computer applications can use this signature file for verification when the user supplies a key, rather than storing a copy of the keys as plaintext. Note that if the MD5 signature file is compromised, short keys are still vulnerable since their MD5 signatures can be found by exhaustive search.
-nnkeys
    Generate nkeys keys. By default, 50 keys are generated.
-rseed
    The string seed is used to initialise the random number generator. Every run of otp with the same seed will produce the same output. This is primarily useful for testing, but it also allows users at different locations to produce identical sheets given only a seed known to both. If you're about to use up all the keys on a sheet, you can generate a new pair of sheets by using the last key on the sheet as the seed for a new one. (This is not as secure as physically exchanging a new pair of sheets, but if you're about to run out of keys, it's better than nothing.) If the -r option is not specified, the generator is initialised with a value derived from the date and time and various system environment information; each run will produce a different sheet.
-snchars
    Include a hyphen separator every nchars characters in the keys. Breaking up long keys into segments with separators makes them easier to transcribe. By default, a hyphen is inserted every 4 characters.
-u
    Print how-to-call information.
-wlinelen
    Format output so lines are less than or equal to linelen characters (unless individual keys exceed the line length). The default line length is 79 characters.

FILES

If no outfile is specified, output is written on standard output.
APPLICATION NOTES

If you're using otp-generated keys for computer system passwords, it's wise to include one or more non-alphanumeric characters and to mix upper and lower case letters; this makes your password much more difficult to guess by exhaustive search. For example, if otp generated a password of jxuc-uiuf and you're using a system on which passwords are limited to 8 characters, you might actually use jXu&uIU= as your password.

When using one-time keys to communicate with other people, it's often a good idea to supply both the current session key and the key for the previous session. It's easy to forget to cross off a key after using it; including the previous key makes it easier to discover if this has happened and get back in sync. Similarly, in computer-based authentication systems it's a good idea to respond to entry of an incorrect key by prompting the user with the key from the last session.

Pseudorandom numbers on which entries in the pads are based are generated by the exclusive-or of four concurrently-running BSD random() generators, each with 256 bytes of state, independently seeded from 4 byte segments of the 16-byte MD5 signature of the original seed.
SEE ALSO

random(3)
EXIT STATUS

otp returns status 0 if processing was completed without errors, and 2 if an error prevented generation of output.
ACKNOWLEDGEMENTS

The English-digraph frequency key generator is based on the “mpw” program developed at MIT, which was converted from Multics PL/I to C by Bill Sommerfeld, 1986-04-21. The original PL/I version was provided by Jerry Saltzer.

The implementation of MD5 message-digest algorithm is based on a public domain version written by Colin Plumb in 1993. The algorithm is due to Ron Rivest. The algorithm is described in Internet RFC 1321.
  Download gzipped TAR archive

    This software is in the public domain. Permission to use, copy, modify, and distribute this software and its documentation for any purpose and without fee is hereby granted, without any conditions or restrictions. This software is provided “as is” without express or implied warranty.

AUTHOR
John Walker
http://www.fourmilab.ch/
February, 1996
Updated: May 1997
Updated: November 2006
Updated: June 2012
Updated: June 2014
