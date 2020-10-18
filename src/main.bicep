param vmSize string = ''
param adminUsername string = 'takekazu.omi'
param adminPassword string {
  secure: true
}

module vnetMod './vnet.bicep' = {
  name: 'vnetMod'
  params: {
    vnetName: 'vNet'
  }
}

//  module vmMod './tmp/id-test.bicep' = {
module vmMod './vm.bicep' = {
    name: 'vmMod'
  params: {
    vnet: vnetMod.outputs.results.vnet
    adminUsername: adminUsername
    adminPassword: adminPassword
    vmSize: vmSize
    vmName: 'vm1'
  }
}

output results object = {
  vnet: vnetMod
  vm: vmMod
}