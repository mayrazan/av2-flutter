# IMake - Projeto exemplo

**TODO:**

- [ ] Adicionar uma tela de login com e-mail e senha. Não precisa autenticar no banco de dados;
- [x] Adicionar um atributo chamado detail, na tarefa, do tipo String;
- [x] Corrigir os erros no arquivo tasks_bloc.dart;
- [x] Trocar o ícone da aplicação para Android;
- [x] Corrija as rotas para que seja possível acessar a tela de splash. Ela deve ser a primeira tela a abrir;
- [x] Adicionar uma tela sobre com informações dos desenvolvedores;
- [x] Trocar o nome do app para Android;
- [x] Implementar a ordenação de tarefas por data.

## Installation

To get this project up and running on your local machine, follow these steps:

1. Ensure you have Flutter installed on your machine. If not, follow the installation guide here: [Flutter Installation](https://flutter.dev/docs/get-started/install).

2. Clone this repository to your local machine:

```bash
git clone https://github.com/mayrazan/av2-flutter.git
```

3. Navigate to the project directory:

```bash
cd av2-flutter
```

4. Install the dependencies:

```bash
flutter pub get
```

5. Run the app:

```bash
flutter run
```

## Make sure you have Java version 17 installed on your system.

### Setting up JAVA_HOME for Java Version 17

In order to work with this project, you need to set the `JAVA_HOME` variable in your environment variables and ensure Java version 17 is installed on your system.

#### Setting JAVA_HOME Variable

**Open the System Properties window:**

- Right-click on This PC or My Computer and select Properties.
- Click on Advanced system settings on the left-hand side.
- In the System Properties window, click on the Environment Variables button.

**In the Environment Variables window:**

Under System variables, click New.
Enter `JAVA_HOME` as the variable name.

Enter the path to your Java JDK installation directory as the variable value. For example:

```bash
C:\Program Files\Java\jdk-17
```

Click OK to save the changes.

### Installing Java Version 17

After setting the `JAVA_HOME` variable, ensure Java version 17 is installed:

Download the Java SE Development Kit 17 from the [official Oracle website](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html).

Once you have set the `JAVA_HOME` variable and installed Java version 17, verify by checking the Java installation:

Open a command prompt and type:

```bash
java --version
```

It should display Java version 17.

With `JAVA_HOME` correctly set and Java version 17 installed, you are now ready to run the project successfully.
