{ inputs, ...}: 

{ 
  age = {
    secrets = {
      secret1 = {
         file = "${inputs.self}/secrets/secret1.age";
        };
      };
    };
  }
