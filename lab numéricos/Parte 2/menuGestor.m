
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

            [nombre, error, tiempo, tiempo2] = Main1(efi, A289, b289, tol, n);
            tiempo3 = toc; % tiempo de todo junto

            % se le resta al tiempo total el tiempo de calcular el 
            % método con error
            tiempoFinal = tiempo3 - tiempo2 + tiempo;
            

            figure
            hold on
            bar(categorical(nombre), error)
            title('Error del método gestionado para matriz 289 x 289')
            ylabel('Error')
            xlabel('Método')
            hold off

            figure
            hold on
            vectorTiempo = [tiempo, tiempoFinal];
            nombres = [nombre, categorical({'Gestor'})];
            bar(nombres, vectorTiempo)
            title('Tiempo del método y el gestor para matriz 289 x 289')
            ylabel('Tiempo')
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

            [nombre, error, tiempo] = Main2(efi, A1089, b1089, tol, n);
            tiempo2 = toc;

            figure
            hold on
            bar(categorical(nombre), error)
            title('Error del método gestionado para matriz 1089 x 1089')
            ylabel('Error')
            xlabel('Método')
            hold off

            figure
            hold on
            vectorTiempo = [tiempo, tiempo2];
            nombres = [nombre, categorical({'Gestor'})];
            bar(nombres, vectorTiempo)
            title('Tiempo del método y el gestor para matriz 1089 x 1089')
            ylabel('Tiempo')
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
            n = 289;

            [nombre, error, tiempo, tiempo2] = Main3(efi, A4225, b4225, tol, n);
            tiempo3 = toc; % tiempo de todo junto

            % se le resta al tiempo total el tiempo de calcular el 
            % método con error
            tiempoFinal = tiempo3 - tiempo2;

            figure
            hold on
            bar(categorical(nombre), error)
            title('Error del método gestionado para matriz 4225 x 4225')
            ylabel('Error')
            xlabel('Método')
            hold off

            figure
            hold on
            vectorTiempo = [tiempo, tiempoFinal];
            nombres = [nombre, categorical({'Gestor'})];
            bar(nombres, vectorTiempo)
            title('Tiempo del método y el gestor para matriz 4225 x 4225')
            ylabel('Tiempo')
            xlabel('Método/Gestor')
            hold off
            break;
        else
            disp('Por favor, selecciona un porcentaje válido.');
        end
    end
end
end