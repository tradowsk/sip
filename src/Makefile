CXX      = mpicxx

CXXFLAGS = -O2 -Wall

LDFLAGS  = -lmpi -L${MPI_DIR}/lib/          \
						-lpetsc -L${PETSC_DIR}/lib/      \
						-lgsl -L${GSL_DIR}/lib/          \
						-lantioch -L${ANTIOCH_DIR}/lib/  \
						-lmesh_opt -L${LIBMESH_DIR}/lib/ \
						-lgrins -L${OPT_GRINS_DIR}/lib/  \
						-lglpk -L${GLPK_DIR}/lib/        \
						-lqueso -L${QUESO_DIR}/lib/

INCLUDE  = -I${MPI_DIR}/include/        \
						-I${PETSC_DIR}/include/     \
						-I${GSL_DIR}/include/       \
						-I${ANTIOCH_DIR}/include/   \
						-I${LIBMESH_DIR}/include/   \
						-I${OPT_GRINS_DIR}/include/ \
						-I${GLPK_DIR}/include/      \
						-I${QUESO_DIR}/include/

TARGET = generate_data generate_surrogate optimizer sip

DEPS = ../catalycity/catalycity_simulation.C

all: $(TARGET)

$(TARGET): %: %.C
	$(CXX) $< $(DEPS) $(CXXFLAGS) $(LDFLAGS) $(INCLUDE) -o $@

.PHONY: clean

clean:
	$(RM) $(TARGET)
	
