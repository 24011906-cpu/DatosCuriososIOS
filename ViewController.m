#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISegmentedControl *categoriasControl;
@property (nonatomic, strong) UILabel *datoLabel;
@property (nonatomic, strong) UIButton *botonDato;
@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSString *> *> *datos;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *indices;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.97 blue:1.0 alpha:1.0];
    self.title = @"¿Sabías qué?";

    self.datos = @{
        @"Naturaleza": @[
            @"Los pulpos tienen tres corazones.",
            @"El bambú puede crecer muy rápido en condiciones favorables.",
            @"Las abejas se comunican mediante movimientos conocidos como danza."
        ],
        @"Ciencia": @[
            @"La luz del Sol tarda aproximadamente 8 minutos en llegar a la Tierra.",
            @"El cuerpo humano adulto suele tener 206 huesos.",
            @"El agua puede existir como sólido, líquido y gas."
        ],
        @"Historia": @[
            @"La imprenta de tipos móviles de Gutenberg se desarrolló en Europa en el siglo XV.",
            @"La Gran Muralla China se construyó en distintas etapas a lo largo de muchos siglos.",
            @"La Universidad de Bolonia se fundó en 1088, según la fecha tradicionalmente aceptada."
        ]
    };
    self.indices = [NSMutableDictionary dictionary];

    UILabel *titulo = [[UILabel alloc] init];
    titulo.text = @"Descubre algo nuevo";
    titulo.font = [UIFont boldSystemFontOfSize:25];
    titulo.textColor = [UIColor colorWithRed:0.12 green:0.25 blue:0.45 alpha:1.0];
    titulo.textAlignment = NSTextAlignmentCenter;
    titulo.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:titulo];

    UILabel *instruccion = [[UILabel alloc] init];
    instruccion.text = @"Selecciona una categoría:";
    instruccion.font = [UIFont systemFontOfSize:17];
    instruccion.textAlignment = NSTextAlignmentCenter;
    instruccion.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:instruccion];

    self.categoriasControl = [[UISegmentedControl alloc] initWithItems:@[@"Naturaleza", @"Ciencia", @"Historia"]];
    self.categoriasControl.selectedSegmentIndex = 0;
    self.categoriasControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.categoriasControl addTarget:self action:@selector(cambiarCategoria) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.categoriasControl];

    UIView *tarjeta = [[UIView alloc] init];
    tarjeta.backgroundColor = UIColor.whiteColor;
    tarjeta.layer.cornerRadius = 16;
    tarjeta.layer.borderWidth = 1;
    tarjeta.layer.borderColor = [UIColor colorWithWhite:0.86 alpha:1].CGColor;
    tarjeta.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:tarjeta];

    UILabel *subtitulo = [[UILabel alloc] init];
    subtitulo.text = @"DATO CURIOSO";
    subtitulo.font = [UIFont boldSystemFontOfSize:13];
    subtitulo.textColor = [UIColor colorWithRed:0.20 green:0.42 blue:0.70 alpha:1.0];
    subtitulo.textAlignment = NSTextAlignmentCenter;
    subtitulo.translatesAutoresizingMaskIntoConstraints = NO;
    [tarjeta addSubview:subtitulo];

    self.datoLabel = [[UILabel alloc] init];
    self.datoLabel.text = @"Presiona el botón para descubrir un dato.";
    self.datoLabel.font = [UIFont systemFontOfSize:19];
    self.datoLabel.textColor = [UIColor darkTextColor];
    self.datoLabel.textAlignment = NSTextAlignmentCenter;
    self.datoLabel.numberOfLines = 0;
    self.datoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [tarjeta addSubview:self.datoLabel];

    self.botonDato = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.botonDato setTitle:@"Mostrar dato curioso" forState:UIControlStateNormal];
    self.botonDato.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [self.botonDato setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.botonDato.backgroundColor = [UIColor colorWithRed:0.16 green:0.38 blue:0.68 alpha:1.0];
    self.botonDato.layer.cornerRadius = 12;
    self.botonDato.translatesAutoresizingMaskIntoConstraints = NO;
    [self.botonDato addTarget:self action:@selector(mostrarDato) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.botonDato];

    [NSLayoutConstraint activateConstraints:@[
        [titulo.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:45],
        [titulo.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [titulo.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],

        [instruccion.topAnchor constraintEqualToAnchor:titulo.bottomAnchor constant:30],
        [instruccion.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [instruccion.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],

        [self.categoriasControl.topAnchor constraintEqualToAnchor:instruccion.bottomAnchor constant:14],
        [self.categoriasControl.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:18],
        [self.categoriasControl.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-18],
        [self.categoriasControl.heightAnchor constraintEqualToConstant:42],

        [tarjeta.topAnchor constraintEqualToAnchor:self.categoriasControl.bottomAnchor constant:35],
        [tarjeta.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:22],
        [tarjeta.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-22],
        [tarjeta.heightAnchor constraintGreaterThanOrEqualToConstant:210],

        [subtitulo.topAnchor constraintEqualToAnchor:tarjeta.topAnchor constant:24],
        [subtitulo.leadingAnchor constraintEqualToAnchor:tarjeta.leadingAnchor constant:15],
        [subtitulo.trailingAnchor constraintEqualToAnchor:tarjeta.trailingAnchor constant:-15],

        [self.datoLabel.topAnchor constraintEqualToAnchor:subtitulo.bottomAnchor constant:18],
        [self.datoLabel.leadingAnchor constraintEqualToAnchor:tarjeta.leadingAnchor constant:20],
        [self.datoLabel.trailingAnchor constraintEqualToAnchor:tarjeta.trailingAnchor constant:-20],
        [self.datoLabel.bottomAnchor constraintLessThanOrEqualToAnchor:tarjeta.bottomAnchor constant:-20],

        [self.botonDato.topAnchor constraintEqualToAnchor:tarjeta.bottomAnchor constant:28],
        [self.botonDato.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:30],
        [self.botonDato.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-30],
        [self.botonDato.heightAnchor constraintEqualToConstant:52]
    ]];
}

- (NSString *)categoriaSeleccionada {
    NSInteger indice = self.categoriasControl.selectedSegmentIndex;
    NSArray *categorias = @[@"Naturaleza", @"Ciencia", @"Historia"];
    return categorias[indice];
}

- (void)cambiarCategoria {
    self.datoLabel.text = @"Presiona el botón para descubrir un dato.";
}

- (void)mostrarDato {
    NSString *categoria = [self categoriaSeleccionada];
    NSArray<NSString *> *lista = self.datos[categoria];
    NSInteger indice = [self.indices[categoria] integerValue];

    self.datoLabel.text = lista[indice % lista.count];
    self.indices[categoria] = @((indice + 1) % lista.count);
}

@end
