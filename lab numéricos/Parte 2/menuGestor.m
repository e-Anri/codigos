
function menuGestor()

while true
    tic
    opcion = menu('Ingrese opción de matriz: ', '289 x 289', '1089 x 1089', '4225 x 4225');
    prompt = {'Ingrese porcentaje de la eficiencia buscada'};
    dlg_title = 'Eficiencia';
    num_lines = 1;
    def = {''};
    answer = inputdlg(prompt, dlg_title, num_lines, def);
    efi = str2double(answer{1});

    % matriz de 289 x 289
    if opcion == 1
        % si la eficiencia se encuentra en el rango adecuado (0-100)
        % procede con el gestor
        if efi >= 0 &&  efi <= 100
            
            %Se cargan las matrices de 289 x 289
            A289 = load('./datos/A289.dat');
            b289 = load('./datos/b289.dat');
            
            % se define la tolerancia e-10
            tol = 0.0000000001;
            n = 289;

            [nombre, error, tiempo, operaciones] = Main1(efi, A289, b289, tol, n);
            tiempo2 = toc; 
            
            operacionesGestor = operaciones + 12;

            figure
            hold on
            bar(categorical(nombre), error)
            title('Error del método gestionado para matriz 289 x 289 con ' + string(efi) + '% de eficiencia')
            ylabel('Error')
            xlabel('Método')
            hold off
            
            vectorTiempo = [string(nombre)+ string(tiempo) + '[s]' + ' Gestor - ' + string(tiempo2) + '[s]'];
            vectorTiempo = categorical(vectorTiempo);
            vectorOperaciones = [operacionesGestor operaciones];

            figure
            hold on
            %nombres = [nombre, categorical({'Gestor'})];
            bar(vectorTiempo, vectorOperaciones)
            title('Tiempo del método gestionado para matriz 289 x 289 con ' + string(efi) + '% de eficiencia')
            ylabel('Operaciones')
            xlabel('Método/Gestor')
            hold off
            
            break;
       else
           disp('Por favor, selecciona un porcentaje válido.');
           break;
        end
        
    % matriz de 1089 x 1089
    elseif opcion == 2
        % si la eficiencia se encuentra en el rango adecuado (0-100)
        % procede con el gestor
        if efi >= 0 &&  efi <= 100

            %Se cargan las matrices de 1089 x 1089
            A1089 = load('./datos/A1089.dat');
            b1089 = load('./datos/b1089.dat');
            
            % se define la tolerancia e-10
            tol = 0.0000000001;
            n = 1089;

            [nombre, error, tiempo, operaciones] = Main2(efi, A1089, b1089, tol, n);
            tiempo2 = toc;

            figure
            hold on
            bar(categorical(nombre), error)
            title('Error del método gestionado para matriz 1089 x 1089 con ' + string(efi) + '% de eficiencia')
            ylabel('Error')
            xlabel('Método')
            hold off

            operacionesGestor = operaciones + 12;
            vectorTiempo = [string(nombre)+ string(tiempo) + '[s]' + ' Gestor - ' + string(tiempo2) + '[s]'];
            vectorTiempo = categorical(vectorTiempo);
            vectorOperaciones = [operacionesGestor operaciones];

            figure
            hold on
            %nombres = [nombre, categorical({'Gestor'})];
            bar(vectorTiempo, vectorOperaciones)
            title('Tiempo del método gestionado para matriz 289 x 289 con ' + string(efi) + '% de eficiencia')
            ylabel('Operaciones')
            xlabel('Método/Gestor')
            hold off
            break;
        else
            disp('Por favor, selecciona un porcentaje válido.');
        end
       
        
    % matriz de 4225 x 4225
    elseif opcion == 3
        % si la eficiencia se encuentra en el rango adecuado (0-100)
        % procede con el gestor
        if efi >= 0 &&  efi <= 100
            %Se cargan las matrices de 4225 x 4225
            A4225 = load('./datos/A4225.dat');
            b4225 = load('./datos/b4225.dat');
            
            % se define la tolerancia e-10
            tol = 0.0000000001;
            n = 4225;

            [nombre, error, tiempo, operaciones] = Main3(efi, A4225, b4225, tol, n);
            tiempo2 = toc; % tiempo de todo junto

            figure
            hold on
            bar(categorical(nombre), error)
            title('Error del método gestionado para matriz 4225 x 4225 con ' + string(efi) + '% de eficiencia')
            ylabel('Error')
            xlabel('Método')
            hold off

            operacionesGestor = operaciones + 12;
            vectorTiempo = [string(nombre)+ string(tiempo) + '[s]' + ' Gestor - ' + string(tiempo2) + '[s]'];
            vectorTiempo = categorical(vectorTiempo);
            vectorOperaciones = [operacionesGestor operaciones];

            figure
            hold on
            %nombres = [nombre, categorical({'Gestor'})];
            bar(vectorTiempo, vectorOperaciones)
            title('Tiempo del método gestionado para matriz 289 x 289 con ' + string(efi) + '% de eficiencia')
            ylabel('Operaciones')
            xlabel('Método/Gestor')
            hold off

            filename = 'data.mat';
            save(filename)

            break;
        else
            disp('Por favor, selecciona un porcentaje válido.');
        end
    end
end
end