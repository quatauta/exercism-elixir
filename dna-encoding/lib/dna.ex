defmodule DNA do
  @moduledoc false

  @type nucleotide_char :: ?\s | ?A | ?C | ?G | ?T
  @type nucleotide_bitstring :: 0 | 1 | 2 | 4 | 8
  @type dna_charlist :: [nucleotide_char()]
  @type dna_bitstring :: <<_::_*4>>

  @spec encode_nucleotide(nucleotide_char()) :: nucleotide_bitstring()
  def encode_nucleotide(?\s), do: 0b0000
  def encode_nucleotide(?A), do: 0b0001
  def encode_nucleotide(?C), do: 0b0010
  def encode_nucleotide(?G), do: 0b0100
  def encode_nucleotide(?T), do: 0b1000

  @spec decode_nucleotide(nucleotide_bitstring()) :: nucleotide_char()
  def decode_nucleotide(0b0000), do: ?\s
  def decode_nucleotide(0b0001), do: ?A
  def decode_nucleotide(0b0010), do: ?C
  def decode_nucleotide(0b0100), do: ?G
  def decode_nucleotide(0b1000), do: ?T

  @spec encode(dna_charlist()) :: dna_bitstring()
  def encode([]), do: <<>>
  def encode([head | tail]), do: <<encode_nucleotide(head)::4, encode(tail)::bitstring>>

  @spec decode(bitstring) :: dna_charlist()
  def decode(<<>>), do: []
  def decode(<<head::4, rest::bitstring>>), do: [decode_nucleotide(head) | decode(rest)]
end
