provider "alicloud" {
  region = "cn-beijing"
}
resource "alicloud_alidns_instance" "example" {
  dns_security   = "no"
  domain_numbers = "2"
  period         = 1
  renew_period   = 1
  renewal_status = "ManualRenewal"
  version_code   = "version_personal"
}

resource "alicloud_alidns_record" "record" {
  domain_name = "domainname"
  rr          = "@"
  type        = "A"
  value       = "192.168.99.99"
  remark      = "Test new alidns record."
  status      = "ENABLE"
}
resource "alicloud_alidns_domain_group" "example" {
  domain_group_name = "tf-testDG"
}

//resource "alicloud_alidns_domain_attachment" "dns" {
//  instance_id     = alicloud_alidns_instance.example.id
//  domain_names    = ["test111.abc", "test222.abc"]
//}

resource "alicloud_alidns_domain" "dns" {
  domain_name   = "starmove.com"
  group_id      = alicloud_alidns_domain_group.example.id
  tags = {
    Created     = "Terraform"
    Environment = "test"
  }
}