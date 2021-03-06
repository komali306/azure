$rg_name = "rg"
$location = "eastus"
$rg = New-AzResourceGroup -Name $rg_name -Location $location
$vm_name = "vml"
$Vnet_name = "vnet"
$prefix = "10.0.0.0/16"
$web_subnet = New-AzVirtualNetworkSubnetConfig -Name "web" -AddressPrefix "10.0.0.0/24" 
$app_subnet = New-AzVirtualNetworkSubnetConfig -Name "app" -AddressPrefix "10.0.1.0/24"
$db_subnet = New-AzVirtualNetworkSubnetConfig -Name "db" -AddressPrefix "10.0.2.0/24"
$vnet = New-AzVirtualNetwork -ResourceGroupName $rg_name -Location $location -Name $Vnet_name -AddressPrefix $prefix -Subnet $web_subnet, $app_subnet, $db_subnet
$Publisher = "Canonical"
$offer = "Ubuntuserver"
$vmsku = "18.04-LTS"
$imageversion = "18.04.202012010"
$size = "Standard_B1s"
$ports_to_be_opened = 3389,22,443
$subnet_name = "app"
$subnet_prefix = "10.0.1.0/24"
$vmimage = Get-AzVMImage -Location $location -PublisherName $Publisher -Offer $offer -Skus $vmsku -Version $imageversion
$vm = New-AzVM -Name "vml"  -ResourceGroupName "rg" -Location "eastus" -VirtualNetworkName "vnet" -AddressPrefix "10.0.0.0/16" -SubnetName "app" -SubnetAddressPrefix "10.0.1.0/24" -Credential (Get-Credential) -Image "UbuntuLTS" -OpenPorts 3389,22,443 -size "Standard_B1s" -PublicIpAddressName "ipps"