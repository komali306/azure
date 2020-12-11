$rg_name = "rglinux1"
$location = "eastus"
$rg = New-AzResourceGroup -Name $rg_name -Location $location
$vm_name = "vmlinux"
$Vnet_name = "vnetlinux"
$prefix = "10.0.0.0/16"
$subnet_name = "webnet"
$subnetprefix = "10.0.1.0/24"
$Publisher = "canonical"
$offer = "ubuntuserver"
$vmsku = "18.04-LTS"
$imageversion = "18.04.202012010"
$size = "Standard_B1s"
$ports_to_be_opened = 3389,22,443
$vmimage = Get-AzVMImage -Location $location -PublisherName $Publisher -Offer $offer -Skus $vmsku -Version $imageversion
$vm = New-AzVM -Name $vm_name -ResourceGroupName $rg -Location $location -VirtualNetworkName $Vnet_name -AddressPrefix $prefix -SubnetName $subnet_name -SubnetAddressPrefix $subnetprefix -Credential (Get-Credential) -ImageName 'UbuntuLTS' -OpenPorts $ports_to_be_opened -size $size -PublicIpAddressName "ipps"