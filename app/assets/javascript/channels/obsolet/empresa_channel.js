import consumer from './consumer'

const div = document.querySelector("[data-empresa-id]");

const initEmpresaChannel = () => {
  if(div){
    const empresaId = div.dataset['empresaId'];
    subscription(empresaId);
  }
}


const subscription = (empresaId) => {
  consumer.subscriptions.create({channel: 'EmpresaChannel', id: empresaId },{
    received(data) {
      updateCurrentTotal(data.empresaTotal);
      addQueixa(data.queixaHTML);
    },
    connected() {
      console.log('connected');
    }
  });
}


const addQueixa= (queixaHTML) => {
  li.insertAdjacentHTML('afterbegin', queixaHTML);
}

const updatetTotal = (empresaTotal) => {
  const span = document.getElementById('total');
  span.textContent = empresaTotal;
}

export { initEmpresaChannel };
