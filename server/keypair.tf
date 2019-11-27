resource "aws_key_pair" "chavo_key" {
  key_name   = "chavo_key"
  public_key = file("id_rsa_pub")
}
