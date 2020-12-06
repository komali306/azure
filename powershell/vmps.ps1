#resource group
$rg_name = "rgps1"
$location = "eastus"
$rg = New-AzResourceGroup -Name $rg_name -Location $location
$Vnet_name = "vnetps"
$prefix = "10.10.0.0/16"
$subnet_name = "webnet"
$subnetprefix = "10.10.1.0/24"
$Publisher = "MicrosoftWindowsServer"
$offer = "WindowsServer"
$vmsku = "2016-Datacenter"
$imageversion = "2016.127.20190416"
$ports_to_be_opened = 3389,22,443
$vmimage = Get-AzVMImage -Location $location -PublisherName $Publisher -Offer $offer -Skus $vmsku -Version $imageversion
$vm = New-AzVM -Name "vm" -ResourceGroupName $rg_name -Location $location -VirtualNetworkName $Vnet_name -AddressPrefix $prefix -SubnetName $subnet_name -SubnetAddressPrefix $subnetprefix -Credential (Get-Credential) -OpenPorts $ports_to_be_opened -size "Standard_B1s" -PublicIpAddressName "ipps"