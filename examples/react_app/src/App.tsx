import { useState } from 'react';
// The package root is Rounded Stroke; every other style is its own path, with the same
// names and AshlarIcon beside them. Only the icons imported here reach the bundle.
import {
  AshlarIcon,
  BellIcon,
  CalendarIcon,
  ChevronRightIcon,
  CreditCardIcon,
  HouseIcon,
  MessageCircleIcon,
  MinibusIcon,
  SearchIcon,
  SmartphoneCashIcon,
  UserIcon,
  WalletPlusIcon,
  type AshlarIconData,
} from '@mittolabs/ashlar-icons-react';
import * as RoundedSolid from '@mittolabs/ashlar-icons-react/rounded-solid';
import * as RoundedDuotone from '@mittolabs/ashlar-icons-react/rounded-duotone';
import * as RoundedTwotone from '@mittolabs/ashlar-icons-react/rounded-twotone';
import * as RoundedBulk from '@mittolabs/ashlar-icons-react/rounded-bulk';
import * as StandardStroke from '@mittolabs/ashlar-icons-react/standard-stroke';
import * as StandardSolid from '@mittolabs/ashlar-icons-react/standard-solid';
import * as StandardDuotone from '@mittolabs/ashlar-icons-react/standard-duotone';
import * as SharpStroke from '@mittolabs/ashlar-icons-react/sharp-stroke';
import * as SharpSolid from '@mittolabs/ashlar-icons-react/sharp-solid';

// An icon is plain data, so a menu can hold it: Stroke for a link, Solid when it is current.
const nav: { label: string; icon: AshlarIconData; current: AshlarIconData }[] = [
  { label: 'Home', icon: HouseIcon, current: RoundedSolid.HouseIcon },
  { label: 'Cards', icon: CreditCardIcon, current: RoundedSolid.CreditCardIcon },
  { label: 'Chats', icon: MessageCircleIcon, current: RoundedSolid.MessageCircleIcon },
  { label: 'Profile', icon: UserIcon, current: RoundedSolid.UserIcon },
];

const styles: [string, AshlarIconData[]][] = [
  ['Rounded Stroke', [HouseIcon, CalendarIcon, CreditCardIcon, MinibusIcon]],
  ['Rounded Solid', [RoundedSolid.HouseIcon, RoundedSolid.CalendarIcon, RoundedSolid.CreditCardIcon, RoundedSolid.MinibusIcon]],
  ['Rounded Duotone', [RoundedDuotone.HouseIcon, RoundedDuotone.CalendarIcon, RoundedDuotone.CreditCardIcon, RoundedDuotone.MinibusIcon]],
  ['Rounded Twotone', [RoundedTwotone.HouseIcon, RoundedTwotone.CalendarIcon, RoundedTwotone.CreditCardIcon, RoundedTwotone.MinibusIcon]],
  ['Rounded Bulk', [RoundedBulk.HouseIcon, RoundedBulk.CalendarIcon, RoundedBulk.CreditCardIcon, RoundedBulk.MinibusIcon]],
  ['Standard Stroke', [StandardStroke.HouseIcon, StandardStroke.CalendarIcon, StandardStroke.CreditCardIcon, StandardStroke.MinibusIcon]],
  ['Standard Solid', [StandardSolid.HouseIcon, StandardSolid.CalendarIcon, StandardSolid.CreditCardIcon, StandardSolid.MinibusIcon]],
  ['Standard Duotone', [StandardDuotone.HouseIcon, StandardDuotone.CalendarIcon, StandardDuotone.CreditCardIcon, StandardDuotone.MinibusIcon]],
  ['Sharp Stroke', [SharpStroke.HouseIcon, SharpStroke.CalendarIcon, SharpStroke.CreditCardIcon, SharpStroke.MinibusIcon]],
  ['Sharp Solid', [SharpSolid.HouseIcon, SharpSolid.CalendarIcon, SharpSolid.CreditCardIcon, SharpSolid.MinibusIcon]],
];

export default function App() {
  const [page, setPage] = useState('Home');
  return (
    <div className="shell">
      <aside>
        <b className="brand">ashlaricons</b>
        {nav.map(({ label, icon, current }) => (
          <button key={label} className={page === label ? 'current' : ''} onClick={() => setPage(label)}>
            <AshlarIcon icon={page === label ? current : icon} size={20} />
            {label}
          </button>
        ))}
      </aside>
      <main>
        <header>
          <h1>{page}</h1>
          <button aria-label="Search"><AshlarIcon icon={SearchIcon} /></button>
          <button aria-label="Notifications"><AshlarIcon icon={BellIcon} /></button>
        </header>

        <ul className="list">
          {[
            [SmartphoneCashIcon, 'Send money', 'To a phone number'],
            [WalletPlusIcon, 'Top up', 'From your bank or card'],
            [MinibusIcon, 'Book a ride', 'Matatu and shuttle routes'],
          ].map(([icon, title, sub]) => (
            <li key={title as string}>
              <AshlarIcon icon={icon as AshlarIconData} />
              <span><b>{title as string}</b>{sub as string}</span>
              <AshlarIcon icon={ChevronRightIcon} className="muted" />
            </li>
          ))}
        </ul>

        <h2>Size and colour</h2>
        <div className="row">
          <AshlarIcon icon={CalendarIcon} size={20} />
          <AshlarIcon icon={CalendarIcon} />
          <AshlarIcon icon={CalendarIcon} size={32} color="#6a4cf0" />
          <AshlarIcon icon={CalendarIcon} size={40} color="#0e7490" aria-label="Calendar" />
          {/* A size class works too: className is passed to the svg. */}
          <AshlarIcon icon={CalendarIcon} className="big accent" />
        </div>

        <h2>Two layers: Duotone, Twotone, Bulk</h2>
        <div className="row accent">
          <AshlarIcon icon={RoundedDuotone.CalendarIcon} size={40} />
          <AshlarIcon icon={RoundedTwotone.CalendarIcon} size={40} />
          <AshlarIcon icon={RoundedBulk.CalendarIcon} size={40} />
          <AshlarIcon icon={RoundedDuotone.CalendarIcon} size={40} secondaryColor="#f59e0b" />
          {/* Or from CSS, for every two-layer icon inside .amber. */}
          <span className="amber"><AshlarIcon icon={RoundedBulk.CreditCardIcon} size={40} /></span>
        </div>

        <h2>All ten styles</h2>
        <table>
          <tbody>
            {styles.map(([title, icons]) => (
              <tr key={title}>
                <th>{title}</th>
                {icons.map((icon) => <td key={icon.name}><AshlarIcon icon={icon} className="accent" /></td>)}
              </tr>
            ))}
          </tbody>
        </table>
      </main>
    </div>
  );
}
