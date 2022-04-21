
function menuGestor()

while true
    opcion = menu('Ingrese opción de matriz: ', '289 x 289', '1089 x 1089', '4225 x 4225', 'salir');
    prompt = {'Ingrese valor de la eficiencia buscada'};
    dlg_title = 'Eficiencia';
    num_lines = 1;
    def = {''};
    answer = inputdlg(prompt, dlg_title, num_lines, def);
    efi = str2double(answer{1});

    % matriz de 289 x 289
    if opcion == 1
        % si la eficiencia se encuentra en el rango adecuado (0-1)
        % procede con el gestor
        if efi >= 0 &&  efi <= 1
           
            % Aqui se llamará a la función del gestor1
            valor = Main1();

           break;
       else
           disp('Por favor, selecciona una eficiencia entre 0 y 1');
           break;
        end
        
    % matriz de 1089 x 1089
    elseif opcion == 2
        % si la eficiencia se encuentra en el rango adecuado (0-1)
        % procede con el gestor
        if efi >= 0 &&  efi <= 1
            
            % Aqui se llamará a la función del gestor2

            break;
        else
            disp('Por favor, selecciona una eficiencia entre 0 y 1');
        end
       
        
    % matriz de 4225 x 4225
    elseif opcion == 3
        % si la eficiencia se encuentra en el rango adecuado (0-1)
        % procede con el gestor
        if efi >= 0 &&  efi <= 1
            
            % Aqui se llamará a la función del gestor3

            break;
        else
            disp('Por favor, selecciona una eficiencia entre 0 y 1');
        end
    end
end
end