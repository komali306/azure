# create a resource group
$resource_group_name = "vnetwithoutzones-ps"
$resource_group_location = "south india"

$resource_group = New-AzResourceGroup -name $resource_group_name -Location $resource_group_location

# add subnets
$web_subnet = New-AzVirtualNetworkSubnetConfig -name "web" -AddressPrefix "198.16.0.0/24"

$app_subnet = New-AzVirtualNetworkSubnetConfig -name "app" -AddressPrefix "198.16.1.0/24"

$db_subnet = New-AzVirtualNetworkSubnetConfig -name "db" -AddressPrefix "198.16.2.0/24"

$mgmt_subnet = New-AzVirtualNetworkSubnetConfig -name "mgmt" -AddressPrefix "198.16.3.0/24"

# create a virtual network and assign subnets
$virtual_network = New-AzVirtualNetwork -AddressPrefix "198.16.0.0/16" -ResourceGroupName $resource_group_name -location $resource_group_location -Subnet $web_subnet , $app_subnet , $db_subnet , $mgmt_subnet -Name "ntier"